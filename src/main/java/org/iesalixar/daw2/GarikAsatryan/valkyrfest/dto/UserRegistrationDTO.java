package org.iesalixar.daw2.GarikAsatryan.valkyrfest.dto;

import jakarta.persistence.Column;
import jakarta.validation.constraints.*;
import lombok.Data;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.validation.IsAdult;

import java.time.LocalDate;

@Data
public class UserRegistrationDTO {

    @NotBlank(message = "{msg.validation.required}")
    @Pattern(regexp = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$", message = "{msg.validation.email}")
    @Size(max = 100, message = "{msg.validation.size}")
    @Column(name = "email", unique = true, nullable = false, length = 100)
    private String email;

    @NotBlank(message = "{msg.validation.required}")
    @Column(name = "password", nullable = false)
    private String password;

    @NotEmpty(message = "{msg.validation.required}")
    @Size(max = 100, message = "{msg.validation.size}")
    @Column(name = "first_name", nullable = false, length = 100)
    private String firstName;

    @NotEmpty(message = "{msg.validation.required}")
    @Size(max = 100, message = "{msg.validation.size}")
    @Column(name = "last_name", nullable = false, length = 100)
    private String lastName;

    @NotNull(message = "{msg.validation.required}")
    @IsAdult
    @Column(name = "birth_date", nullable = false)
    private LocalDate birthDate;

    @NotEmpty(message = "{msg.validation.required}")
    @Size(max = 30, message = "{msg.validation.size}")
    @Column(name = "phone", nullable = false, length = 30)
    private String phone;
}
