package org.iesalixar.daw2.GarikAsatryan.valkyrfest.services;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.stripe.Stripe;
import com.stripe.model.Event;
import com.stripe.model.EventDataObjectDeserializer;
import com.stripe.model.checkout.Session;
import com.stripe.net.Webhook;
import com.stripe.param.checkout.SessionCreateParams;
import jakarta.annotation.PostConstruct;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.entities.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class PaymentService {

    private static final Logger logger = LoggerFactory.getLogger(PaymentService.class);
    private final OrderService orderService;
    private final PdfGeneratorService pdfGeneratorService;
    private final EmailService emailService;
    private final ObjectMapper objectMapper;

    @Value("${stripe.secret.key}")
    private String secretKey;

    @Value("${stripe.webhook.secret}")
    private String endpointSecret;

    @Value("${app.url}")
    private String appUrl;

    @PostConstruct
    public void init() {
        Stripe.apiKey = secretKey;
    }

    public String createStripeSession(Order order) throws Exception {
        SessionCreateParams params = SessionCreateParams.builder()
                .addPaymentMethodType(SessionCreateParams.PaymentMethodType.CARD)
                .setMode(SessionCreateParams.Mode.PAYMENT)
                .setClientReferenceId(order.getId().toString())
                .setSuccessUrl(appUrl + "/purchase/success")
                .setCancelUrl(appUrl + "/purchase/checkout")
                .addLineItem(
                        SessionCreateParams.LineItem.builder()
                                .setQuantity(1L)
                                .setPriceData(
                                        SessionCreateParams.LineItem.PriceData.builder()
                                                .setCurrency("eur")
                                                .setUnitAmount(order.getTotalPrice().movePointRight(2).longValue())
                                                .setProductData(
                                                        SessionCreateParams.LineItem.PriceData.ProductData.builder()
                                                                .setName("Pedido Valkyrfest #" + order.getId())
                                                                .build()
                                                )
                                                .build()
                                )
                                .build()
                )
                .build();

        Session session = Session.create(params);
        return session.getUrl();
    }

    @Transactional
    public void processWebhookEvent(String payload, String sigHeader) throws Exception {
        logger.info("Webhook de Stripe recibido.");
        Event event = Webhook.constructEvent(payload, sigHeader, endpointSecret);
        logger.info("Evento validado: {}", event.getType());

        if ("checkout.session.completed".equals(event.getType())) {
            EventDataObjectDeserializer dataObjectDeserializer = event.getDataObjectDeserializer();
            String orderIdStr = null;

            // Intento 1: Deserialización estándar
            if (dataObjectDeserializer.getObject().isPresent()) {
                Session session = (Session) dataObjectDeserializer.getObject().get();
                orderIdStr = session.getClientReferenceId();
                logger.info("Sesión deserializada correctamente.");
            }
            // Intento 2: Extracción manual con Jackson (Fallback)
            else {
                logger.warn("Fallo de deserialización por versión. Usando extracción manual con Jackson.");
                String rawJson = dataObjectDeserializer.getRawJson();
                JsonNode node = objectMapper.readTree(rawJson);
                if (node.has("client_reference_id") && !node.get("client_reference_id").isNull()) {
                    orderIdStr = node.get("client_reference_id").asText();
                }
            }

            if (orderIdStr != null) {
                try {
                    Long orderId = Long.parseLong(orderIdStr);

                    // 1. Marcar como PAID en la DB (Transaccional)
                    Order order = orderService.confirmPayment(orderId);
                    logger.info("Pedido #{} marcado como PAID en DB.", orderId);

                    // 2. Procesos secundarios (PDF y Email)
                    try {
                        byte[] pdfBytes = pdfGeneratorService.generateOrderPdf(order);
                        emailService.sendOrderConfirmationEmail(order, pdfBytes);
                        logger.info("Email enviado a Mailtrap con éxito.");
                    } catch (Exception e) {
                        logger.warn("El pago se guardó, pero falló el envío del email: {}", e.getMessage());
                    }

                } catch (Exception e) {
                    logger.error("ERROR CRÍTICO procesando el webhook", e);
                    throw e;
                }
            } else {
                logger.error("No se encontró clientReferenceId en el evento de Stripe.");
            }
        }
    }
}