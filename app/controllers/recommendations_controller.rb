class RecommendationsController < ApplicationController
    def index
        recommendations = RSpotify::Recommendations.generate(seed_artists: ['3GP0RQRnBvpYVgdVYfcaGS'], seed_genres: ['post-teen-pop'], seed_tracks: ['73GtVPSJZIO8ABP7MeXFHk'], target_energy: 0.95, limit: 12, market: 'JP')
        @tracks = recommendations.tracks.map { |track| { name: track.name, artist: track.artists.first.name, preview_url: track.preview_url, album_image_url: track.album.images.first["url"] } }
    end
      
      
end
