package org.iesalixar.daw2.GarikAsatryan.valkyrfest.controllers.admin;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.entities.Order;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.entities.OrderStatus;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.services.OrderService;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.services.UserService;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/festival/orders")
@RequiredArgsConstructor
public class OrderAdminController {

    private final OrderService orderService;
    private final UserService userService;
    private final MessageSource messageSource;

    @GetMapping
    public String listOrders(Model model) {
        model.addAttribute("orders", orderService.getAllOrders());
        model.addAttribute("activePage", "orders");
        return "admin/orders/list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("order", new Order());
        model.addAttribute("users", userService.getAllUsers());
        model.addAttribute("statuses", OrderStatus.values());
        model.addAttribute("activePage", "orders");
        return "admin/orders/form";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        orderService.getOrderById(id).ifPresent(order -> model.addAttribute("order", order));
        model.addAttribute("users", userService.getAllUsers());
        model.addAttribute("statuses", OrderStatus.values());
        model.addAttribute("activePage", "orders");
        return "admin/orders/form";
    }

    @PostMapping("/save")
    public String saveOrder(
            @Valid @ModelAttribute("order") Order order,
            BindingResult result,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        if (result.hasErrors()) {
            model.addAttribute("users", userService.getAllUsers());
            model.addAttribute("statuses", OrderStatus.values());
            model.addAttribute("activePage", "orders");
            return "admin/orders/form";
        }

        orderService.saveOrder(order);

        redirectAttributes.addFlashAttribute("successMessage",
                messageSource.getMessage("msg.admin.order.save.success", null, LocaleContextHolder.getLocale()));

        return "redirect:/admin/festival/orders";
    }

    @GetMapping("/delete/{id}")
    public String deleteOrder(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        orderService.deleteOrder(id);

        redirectAttributes.addFlashAttribute("successMessage",
                messageSource.getMessage("msg.admin.order.delete.success", null, LocaleContextHolder.getLocale()));

        return "redirect:/admin/festival/orders";
    }
}