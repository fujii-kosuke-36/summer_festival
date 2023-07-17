class Admin::ArtistsController < Admin::BaseController
    def index
        @artists = Artist.all
    end

    def new
        @artist = Artist.new
    end
    
    def create
    @artist = Artist.new(artist_params)
    if @artist.save
        redirect_to admin_artist_path(@artist), notice: 'アーティストが追加されました。'
    else
        flash.now[:error] = 'アーティストの追加に失敗しました。'
        render :new
    end
    end

    def search
        if params[:search].present?
          @artists = RSpotify::Artist.search(params[:search])
        end
    end
  
    private
  
    def artist_params
      params.require(:artist).permit(:artist_name, :artist_image)
    end
  end
  