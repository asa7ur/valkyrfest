package org.iesalixar.daw2.GarikAsatryan.valkyrfest.controllers;

import lombok.RequiredArgsConstructor;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.dto.OrderRequestDTO;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.entities.Order;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.entities.User;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.services.OrderService;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.services.PaymentService;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.services.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/orders")
@RequiredArgsConstructor
public class OrderRestController {

    private final OrderService orderService;
    private final UserService userService;
    private final PaymentService paymentService;

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