class Admin::ArtistsController < Admin::BaseController
    
    def index
        @artists = Artist.all
    end

    def show
        @artist= Artist.find(params[:id])
        @recommended_artists = RSpotify::Recommendations.generate(seed_artists: [@artist.spotify_id])
    end
    
    def create
        @artist = Artist.new(artist_params)
        if @artist.save
          redirect_to admin_artists_path
        end
    end

    def search
        if params[:search].present?
          @artists = RSpotify::Artist.search(params[:search])
        end
    end
  
    private
  
    def artist_params
        params.permit(:spotify_id, :artist_name, :artist_image)
    end
  end
  