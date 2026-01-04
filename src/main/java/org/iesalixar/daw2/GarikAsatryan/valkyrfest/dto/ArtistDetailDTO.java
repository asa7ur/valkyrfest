package org.iesalixar.daw2.GarikAsatryan.valkyrfest.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ArtistDetailDTO {
    private Long id;
    private String name;
    private String genre;
    private String country;
    private String logo;
    private String description;
    private String youtubeUrl;
    private String spotifyUrl;
    private String instagramUrl;
    private List<ArtistImageDTO> images;
}