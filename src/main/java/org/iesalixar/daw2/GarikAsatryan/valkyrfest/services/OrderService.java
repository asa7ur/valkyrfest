package org.iesalixar.daw2.GarikAsatryan.valkyrfest.services;

import lombok.RequiredArgsConstructor;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.dto.CampingRequestDTO;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.dto.OrderRequestDTO;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.dto.TicketRequestDTO;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.entities.*;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.exceptions.AppException;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.repositories.CampingTypeRepository;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.repositories.OrderRepository;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.repositories.TicketTypeRepository;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.repositories.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class OrderService {
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final TicketTypeRepository ticketTypeRepository;
    private final CampingTypeRepository campingTypeRepository;

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public Optional<Order> getOrderById(Long id) {
        return orderRepository.findById(id);
    }

    @Transactional
    public void saveOrder(Order order) {
        orderRepository.save(order);
    }

    @Transactional
    public void deleteOrder(Long id) {
        orderRepository.deleteById(id);
    }

    @Transactional
    public void createOrder(OrderRequestDTO request) {
        User user = userRepository.findById(request.getUserId())
                .orElseThrow(() -> new AppException("msg.error.userNotFound"));

        Order order = new Order();
        order.setUser(user);
        order.setStatus(OrderStatus.PENDING);
        BigDecimal totalPrice = BigDecimal.ZERO;

        for (TicketRequestDTO ticketDto : request.getTickets()) {
            TicketType type = ticketTypeRepository.findById(ticketDto.getTicketTypeId())
                    .orElseThrow(() -> new AppException("msg.error.ticketTypeNotFound"));

            if (type.getStockAvailable() <= 0) {
                throw new AppException("msg.error.noStock", type.getName());
            }

            type.setStockAvailable(type.getStockAvailable() - 1);
            ticketTypeRepository.save(type);

            Ticket ticket = new Ticket();
            ticket.setFirstName(ticketDto.getFirstName());
            ticket.setLastName(ticketDto.getLastName());
            ticket.setDocumentType(ticketDto.getDocumentType());
            ticket.setDocumentNumber(ticketDto.getDocumentNumber());
            ticket.setBirthDate(ticketDto.getBirthDate());
            ticket.setQrCode(UUID.randomUUID().toString());
            ticket.setTicketType(type);
            ticket.setOrder(order);
            ticket.setStatus(TicketStatus.ACTIVE);

            order.getTickets().add(ticket);
            totalPrice = totalPrice.add(type.getPrice());
        }

        if (request.getCampings() != null && !request.getCampings().isEmpty()) {
            for (CampingRequestDTO campingDto : request.getCampings()) {
                CampingType type = campingTypeRepository.findById(campingDto.getCampingTypeId())
                        .orElseThrow(() -> new AppException("msg.error.campingTypeNotFound"));

                if (type.getStockAvailable() <= 0) {
                    throw new AppException("msg.error.noStock", type.getName());
                }

                type.setStockAvailable(type.getStockAvailable() - 1);
                campingTypeRepository.save(type);

                Camping camping = new Camping();
                camping.setFirstName(campingDto.getFirstName());
                camping.setLastName(campingDto.getLastName());
                camping.setDocumentType(campingDto.getDocumentType());
                camping.setDocumentNumber(campingDto.getDocumentNumber());
                camping.setBirthDate(campingDto.getBirthDate());
                camping.setQrCode(UUID.randomUUID().toString());
                camping.setCampingType(type);
                camping.setOrder(order);
                camping.setStatus(TicketStatus.ACTIVE);

                order.getCampings().add(camping);
                totalPrice = totalPrice.add(type.getPrice());
            }
        }

        order.setTotalPrice(totalPrice);
        orderRepository.save(order);
    }
}