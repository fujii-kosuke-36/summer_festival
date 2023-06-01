class RecommendationsController < ApplicationController
    def index
        recommendations = RSpotify::Recommendations.generate(seed_artists: ['0SMhG4gXGD4gzLMMz08cQU'], seed_genres: ['post-teen pop'], target_energy: 0.85, limit: 12, market: 'JP')
        @tracks = recommendations.tracks.map { |track| { name: track.name, artist: track.artists.first.name, preview_url: track.preview_url, album_image_url: track.album.images.first["url"] } }
    end

    def create
        @artist = Artist.find(params[:artist_id])
        if @artist.generate_recommendations
        redirect_to @artist
        else
        flash[:error] = "おすすめアーティストの生成に失敗しました。"
        redirect_back(fallback_location: root_path)
        end
    end
end
