package org.iesalixar.daw2.GarikAsatryan.valkyrfest.services;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.dto.ArtistDTO;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.dto.ArtistDetailDTO;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.dto.ArtistImageDTO;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.entities.Artist;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.entities.ArtistImage;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.repositories.ArtistImageRepository;
import org.iesalixar.daw2.GarikAsatryan.valkyrfest.repositories.ArtistRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ArtistService {

    private final ArtistRepository artistRepository;
    private final ArtistImageRepository artistImageRepository;
    private final FileService fileService;

    private static final String ARTISTS_FOLDER = "artists";

    public List<Artist> getAllArtists() {
        return artistRepository.findAll();
    }

    public Optional<Artist> getArtistById(Long id) {
        return artistRepository.findById(id);
    }

    public Page<Artist> getAllArtists(String searchTerm, Pageable pageable) {
        if (searchTerm != null && !searchTerm.isEmpty()) {
            return artistRepository.searchArtists(searchTerm, pageable);
        }
        return artistRepository.findAll(pageable);
    }

    @Transactional
    public void saveArtist(Artist artist, MultipartFile logoFile, MultipartFile[] imageFiles) throws IOException {
        Artist artistToSave;

        if (artist.getId() != null) {
            artistToSave = artistRepository.findById(artist.getId())
                    .orElseThrow(() -> new RuntimeException("Artist not found"));

            artistToSave.setName(artist.getName());
            artistToSave.setPhone(artist.getPhone());
            artistToSave.setEmail(artist.getEmail());
            artistToSave.setGenre(artist.getGenre());
            artistToSave.setCountry(artist.getCountry());

            // CORRECCIÓN: Añadidos los nuevos campos para que se actualicen
            artistToSave.setDescription(artist.getDescription());
            artistToSave.setYoutubeUrl(artist.getYoutubeUrl());
            artistToSave.setSpotifyUrl(artist.getSpotifyUrl());
            artistToSave.setInstagramUrl(artist.getInstagramUrl());

        } else {
            artistToSave = artist;
        }

        if (logoFile != null && !logoFile.isEmpty()) {
            if (artistToSave.getLogo() != null) {
                fileService.deleteFile(artistToSave.getLogo(), ARTISTS_FOLDER);
            }
            String logoName = fileService.saveFile(logoFile, ARTISTS_FOLDER);
            artistToSave.setLogo(logoName);
        }

        Artist savedArtist = artistRepository.save(artistToSave);

        if (imageFiles != null && imageFiles.length > 0) {
            for (MultipartFile file : imageFiles) {
                if (!file.isEmpty()) {
                    String fileName = fileService.saveFile(file, ARTISTS_FOLDER);
                    ArtistImage artistImage = new ArtistImage();
                    artistImage.setImageUrl(fileName);
                    artistImage.setArtist(savedArtist);
                    artistImageRepository.save(artistImage);
                }
            }
        }
    }

    public Optional<ArtistDetailDTO> getArtistDetailById(Long id) {
        return artistRepository.findById(id).map(artist -> {
            ArtistDetailDTO dto = new ArtistDetailDTO();
            dto.setId(artist.getId());
            dto.setName(artist.getName());
            dto.setGenre(artist.getGenre());
            dto.setCountry(artist.getCountry());
            dto.setLogo(artist.getLogo());
            dto.setDescription(artist.getDescription());
            dto.setYoutubeUrl(artist.getYoutubeUrl());
            dto.setSpotifyUrl(artist.getSpotifyUrl());
            dto.setInstagramUrl(artist.getInstagramUrl());

            // CORRECCIÓN: Mapear a ArtistImageDTO para que coincida con el frontend
            dto.setImages(artist.getImages().stream()
                    .map(img -> new ArtistImageDTO(img.getId(), img.getImageUrl()))
                    .collect(Collectors.toList()));
            return dto;
        });
    }

    @Transactional
    public void deleteArtist(Long id) {
        artistRepository.findById(id).ifPresent(artist -> {
            if (artist.getLogo() != null) fileService.deleteFile(artist.getLogo(), ARTISTS_FOLDER);
            artist.getImages().forEach(img -> fileService.deleteFile(img.getImageUrl(), ARTISTS_FOLDER));
            artistRepository.delete(artist);
        });
    }

    @Transactional
    public void deleteLogo(Long id) {
        artistRepository.findById(id).ifPresent(artist -> {
            if (artist.getLogo() != null) {
                fileService.deleteFile(artist.getLogo(), ARTISTS_FOLDER);
                artist.setLogo(null);
                artistRepository.save(artist);
            }
        });
    }

    @Transactional
    public void deleteArtistImage(Long imageId) {
        artistImageRepository.findById(imageId).ifPresent(img -> {
            fileService.deleteFile(img.getImageUrl(), ARTISTS_FOLDER);
            artistImageRepository.delete(img);
        });
    }

    public List<ArtistDTO> getAllArtistsDTO() {
        return artistRepository.findAll().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    private ArtistDTO convertToDTO(Artist artist) {
        return new ArtistDTO(
                artist.getId(),
                artist.getName(),
                artist.getGenre(),
                artist.getCountry(),
                artist.getLogo(),
                artist.getImages().stream()
                        .map(img -> new ArtistImageDTO(img.getId(), img.getImageUrl()))
                        .collect(Collectors.toList())
        );
    }
}