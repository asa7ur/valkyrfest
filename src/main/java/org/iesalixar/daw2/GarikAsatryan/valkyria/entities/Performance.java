package org.iesalixar.daw2.GarikAsatryan.valkyria.entities;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import org.iesalixar.daw2.GarikAsatryan.valkyria.validation.FieldsComparison;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Entity
@Table(name = "performances")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = {"artist", "stage"})
@EqualsAndHashCode(exclude = {"artist", "stage"})
@FieldsComparison(
        first = "startTime",
        second = "endTime",
        message = "{msg.validation.performance.time}"
)
public class Performance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "{msg.validation.required}")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    @Column(name = "start_time", nullable = false)
    private LocalDateTime startTime;

    @NotNull(message = "{msg.validation.required}")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    @Column(name = "end_time", nullable = false)
    private LocalDateTime endTime;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "artist_id", nullable = false)
    @JsonIgnoreProperties("performances")
    private Artist artist;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "stage_id", nullable = false)
    @JsonIgnoreProperties("performances")
    private Stage stage;
}
