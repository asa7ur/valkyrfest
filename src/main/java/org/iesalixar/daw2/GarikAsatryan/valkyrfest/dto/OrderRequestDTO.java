package org.iesalixar.daw2.GarikAsatryan.valkyrfest.dto;

import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.List;

@Data
public class OrderRequestDTO {
    @NotNull(message = "{msg.validation.required}")
    private Long userId;

    @NotEmpty(message = "{msg.validation.atLeastOne}")
    @Valid
    private List<TicketRequestDTO> tickets;

    @Valid
    private List<CampingRequestDTO> campings;
}
