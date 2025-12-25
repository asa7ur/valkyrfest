package org.iesalixar.daw2.GarikAsatryan.valkyrfest.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.validation.FieldsComparison;

import java.math.BigDecimal;

@Entity
@Table(name = "ticket_types")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@FieldsComparison(
        first = "stockAvailable",
        second = "stockTotal",
        message = "{msg.ticketType.stock.invalid}"
)
public class TicketType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "{msg.ticketType.name.notBlank}")
    @Size(max = 50, message = "{msg.ticketType.name.size}")
    @Column(name = "name", nullable = false, length = 50)
    private String name;

    @NotNull(message = "{msg.ticketType.price.notNull}")
    @PositiveOrZero(message = "{msg.ticketType.price.positive}")
    @Column(name = "price", nullable = false, precision = 10, scale = 2)
    private BigDecimal price;

    @NotNull(message = "{msg.ticketType.stockTotal.notNull}")
    @PositiveOrZero(message = "{msg.ticketType.stockTotal.positive}")
    @Column(name = "stock_total", nullable = false)
    private Integer stockTotal;

    @NotNull(message = "{msg.ticketType.stockAvailable.notNull}")
    @PositiveOrZero(message = "{msg.ticketType.stockAvailable.positive}")
    @Column(name = "stock_available", nullable = false)
    private Integer stockAvailable;
}
