class Admin::ArtistsController < Admin::BaseController
    before_action :set_artist, only: %i[show edit update destroy]
    def index
        @artists = Artist.all
    end

    def show
        @artist.fetch_spotify_data
        #@recommended_artists = RSpotify::Recommendations.generate(seed_artists: [@artist.spotify_id])
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

    def edit
        
    end

    def update
        if @artist.update(artist_params)
          flash[:success] = "アーティスト情報を更新しました"
          redirect_to admin_artist_path(@artist)
        else
          flash[:danger] = "アーティスト情報の更新に失敗しました"
          render :edit
        end
      end
    
  
    private
  
    def artist_params
        params.permit(:spotify_id, :artist_name, :artist_image)
    end

    def set_artist
        @artist = Artist.find(params[:id])
    end
  end
  