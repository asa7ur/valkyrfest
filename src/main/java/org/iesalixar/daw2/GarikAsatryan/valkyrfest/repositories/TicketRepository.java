package org.iesalixar.daw2.GarikAsatryan.valkyrfest.repositories;

import org.iesalixar.daw2.GarikAsatryan.valkyrfest.entities.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TicketRepository extends JpaRepository<Ticket, Long> {
}
