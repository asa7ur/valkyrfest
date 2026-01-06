package org.iesalixar.daw2.GarikAsatryan.valkyria.controllers;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.iesalixar.daw2.GarikAsatryan.valkyria.dto.UserRegistrationDTO;
import org.iesalixar.daw2.GarikAsatryan.valkyria.entities.User;
import org.iesalixar.daw2.GarikAsatryan.valkyria.exceptions.AppException;
import org.iesalixar.daw2.GarikAsatryan.valkyria.security.JwtService;
import org.iesalixar.daw2.GarikAsatryan.valkyria.services.RegistrationService;
import org.iesalixar.daw2.GarikAsatryan.valkyria.services.UserService;
import org.iesalixar.daw2.GarikAsatryan.valkyria.services.VerificationTokenService;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200") // Permite peticiones desde Angular
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final UserDetailsService userDetailsService;
    private final JwtService jwtService;
    private final RegistrationService registrationService;
    private final MessageSource messageSource;
    private final VerificationTokenService verificationTokenService;
    private final UserService userService;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Map<String, String> request) {
        // 1. Autenticar credenciales (usa el email según tu CustomUserDetailsService)
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(request.get("username"), request.get("password"))
        );

        // 2. Si es correcto, cargar el usuario y generar Token
        final UserDetails userDetails = userDetailsService.loadUserByUsername(request.get("username"));
        final String jwt = jwtService.generateToken(userDetails);

        // 3. Responder a Angular
        Map<String, Object> response = new HashMap<>();
        response.put("token", jwt);
        response.put("username", userDetails.getUsername());
        response.put("roles", userDetails.getAuthorities());

        return ResponseEntity.ok(response);
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@Valid @RequestBody UserRegistrationDTO registrationDTO) {
        try {
            registrationService.registerUser(registrationDTO);
            Map<String, String> response = new HashMap<>();
            response.put("message", messageSource.getMessage("msg.register.success", null, LocaleContextHolder.getLocale()));
            return ResponseEntity.ok(response);
        } catch (AppException e) {
            String errorMessage = messageSource.getMessage(e.getMessageKey(), e.getArgs(), LocaleContextHolder.getLocale());
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("error", errorMessage);
            return ResponseEntity.badRequest().body(errorResponse);
        }
    }

    @GetMapping("/confirm")
    public ResponseEntity<?> confirmRegistration(@RequestParam("token") String token) {
        return verificationTokenService.getVerificationToken(token)
                .map(verificationToken -> {
                    if (verificationToken.isExpired()) {
                        Map<String, String> response = new HashMap<>();
                        response.put("error", messageSource.getMessage("msg.register.error.invalidToken", null, LocaleContextHolder.getLocale()));
                        return ResponseEntity.badRequest().body(response);
                    }

                    User user = verificationToken.getUser();
                    user.setEnabled(true);
                    userService.saveUser(user);
                    verificationTokenService.deleteToken(verificationToken);

                    Map<String, String> response = new HashMap<>();
                    response.put("message", "Account activated");
                    return ResponseEntity.ok(response);
                })
                .orElseGet(() -> {
                    Map<String, String> response = new HashMap<>();
                    response.put("error", "Invalid token");
                    return ResponseEntity.badRequest().body(response);
                });
    }
}