package org.iesalixar.daw2.GarikAsatryan.valkyrfest.repositories;

import org.iesalixar.daw2.GarikAsatryan.valkyrfest.entities.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    Page<User> findByNameContainingIgnoreCase(String name, Pageable pageable);
}
