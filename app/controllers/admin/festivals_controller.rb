class Admin::FestivalsController < Admin::BaseController
    def index
        @festivals = Festival.all
    end

    def new
        @festival = Festival.new
        @artists = Artist.all
    end
    
    def create
        @festival = Festival.new(festival_params)
        if @festival.save
        flash[:success] = "フェスを登録しました"
        redirect_to root_url
        else
        flash[:danger] = "フェスが登録できませんでした"
        render :new
        end
    end

    def show
        @festival = Festival.find(params[:id])
        @artists = @festival.artists
        end
    
    private
    
    def festival_params
        params.require(:festival).permit(:name, :location, :prefecture, :region, artist_ids: [])
    end
    end
