package org.iesalixar.daw2.GarikAsatryan.valkyrfest.controllers.admin;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.entities.Sponsor;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.services.SponsorService;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin/festival/sponsors")
@RequiredArgsConstructor
public class SponsorAdminController {

    private final SponsorService sponsorService;
    private final MessageSource messageSource;

    @GetMapping
    public String listSponsors(Model model) {
        model.addAttribute("sponsors", sponsorService.getAllSponsors());
        model.addAttribute("activePage", "sponsors");
        return "admin/sponsors/list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("sponsor", new Sponsor());
        model.addAttribute("activePage", "sponsors");
        return "admin/sponsors/form";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        sponsorService.getSponsorById(id).ifPresent(s -> model.addAttribute("sponsor", s));
        model.addAttribute("activePage", "sponsors");
        return "admin/sponsors/form";
    }

    @PostMapping("/save")
    public String saveSponsor(
            @Valid @ModelAttribute("sponsor") Sponsor sponsor,
            BindingResult result,
            RedirectAttributes redirectAttributes,
            Model model
    ) {
        if (result.hasErrors()) {
            model.addAttribute("activePage", "sponsors");
            return "admin/sponsors/form";
        }

        sponsorService.saveSponsor(sponsor);

        redirectAttributes.addFlashAttribute("successMessage",
                messageSource.getMessage("msg.admin.sponsor.save.success", null, LocaleContextHolder.getLocale()));

        return "redirect:/admin/festival/sponsors";
    }

    @GetMapping("/delete/{id}")
    public String deleteSponsor(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        sponsorService.deleteSponsor(id);

        redirectAttributes.addFlashAttribute("successMessage",
                messageSource.getMessage("msg.admin.sponsor.delete.success", null, LocaleContextHolder.getLocale()));

        return "redirect:/admin/festival/sponsors";
    }
}