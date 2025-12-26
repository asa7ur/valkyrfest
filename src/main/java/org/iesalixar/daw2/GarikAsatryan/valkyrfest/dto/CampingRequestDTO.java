package org.iesalixar.daw2.GarikAsatryan.valkyrfest.dto;

import jakarta.persistence.Column;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.entities.DocumentType;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.validation.IsAdult;

import java.time.LocalDate;

@Data
public class CampingRequestDTO {
    @NotBlank(message = "{msg.validation.required}")
    @Size(max = 100, message = "{msg.validation.size}")
    @Column(name = "first_name", nullable = false, length = 100)
    private String firstName;

    @NotBlank(message = "{msg.validation.required}")
    @Size(max = 100, message = "{msg.validation.size}")
    @Column(name = "last_name", nullable = false, length = 100)
    private String lastName;

    @NotNull(message = "{msg.validation.required}")
    @Enumerated(EnumType.STRING)
    @Column(name = "document_type", nullable = false)
    private DocumentType documentType;

    @NotBlank(message = "{msg.validation.required}")
    @Size(max = 20, message = "{msg.validation.size}")
    @Column(name = "document_number", nullable = false, length = 20)
    private String documentNumber;

    @NotNull(message = "{msg.validation.required}")
    @IsAdult
    @Column(name = "birth_date", nullable = false)
    private LocalDate birthDate;

    @NotNull(message = "{msg.validation.required}")
    @Column(name = "camping_type_id", nullable = false)
    private Long campingTypeId;
}
