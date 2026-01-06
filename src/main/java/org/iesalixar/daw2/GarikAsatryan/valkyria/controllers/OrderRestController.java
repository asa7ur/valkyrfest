package org.iesalixar.daw2.GarikAsatryan.valkyria.controllers;

import lombok.RequiredArgsConstructor;
import org.iesalixar.daw2.GarikAsatryan.valkyria.dto.OrderRequestDTO;
import org.iesalixar.daw2.GarikAsatryan.valkyria.entities.Order;
import org.iesalixar.daw2.GarikAsatryan.valkyria.entities.User;
import org.iesalixar.daw2.GarikAsatryan.valkyria.services.OrderService;
import org.iesalixar.daw2.GarikAsatryan.valkyria.services.PaymentService;
import org.iesalixar.daw2.GarikAsatryan.valkyria.services.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/orders")
@RequiredArgsConstructor
public class OrderRestController {

    private final OrderService orderService;
    private final UserService userService;
    private final PaymentService paymentService;

    @GetMapping("/my-orders")
    public ResponseEntity<List<Order>> getMyOrders(Authentication authentication) {
        // Obtenemos el email del usuario autenticado (desde el JWT que envía el interceptor)
        String email = authentication.getName();

        // Buscamos sus pedidos
        List<Order> orders = orderService.getOrdersByUser(email);

        // Devolvemos la lista en formato JSON
        return ResponseEntity.ok(orders);
    }

    @PostMapping
    public ResponseEntity<?> checkout(@RequestBody OrderRequestDTO request, Authentication authentication) {
        try {
            // 1. Obtener usuario autenticado
            User user = userService.getUserByEmail(authentication.getName());

            // 2. Ejecutar la lógica de pedido que ya tienes en OrderService (valida stock y guarda)
            Order order = orderService.executeOrder(request, user);

            // 3. Crear la sesión de Stripe
            String stripeUrl = paymentService.createStripeSession(order);

            // 4. Devolver la URL de pago al frontend
            return ResponseEntity.ok(Map.of("url", stripeUrl));

        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Map.of("message", e.getMessage()));
        }
    }
}