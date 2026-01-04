package org.iesalixar.daw2.GarikAsatryan.valkyrfest.controllers;

import lombok.RequiredArgsConstructor;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.dto.ArtistDTO;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.services.ArtistService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/artists")
@CrossOrigin(origins = "http://localhost:4200")
@RequiredArgsConstructor
public class ArtistController {

    private final ArtistService artistService;

    @GetMapping("/artists")
    public List<ArtistDTO> getArtists() {
        return artistService.getAllArtistsDTO();
    }
}