class Admin::FestivalsController < Admin::BaseController
    before_action :set_festival, only: %i[edit update show]
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

    def edit
        @artists = Artist.all
    end
    
    def update
    if @festival.update(festival_params)
        flash[:success] = "フェスを更新しました"
        redirect_to root_url
    else
        flash[:danger] = "フェスが更新できませんでした"
        render :edit
    end
    end

    def show
        @artists = @festival.artists
    end
    
    private
    
    def festival_params
        params.require(:festival).permit(:name, :location, :prefecture, :region, artist_ids: [])
    end

    def set_festival
        @festival = Festival.find(params[:id])
    end
end
