class Admin::FestivalsController < Admin::BaseController
    before_action :set_festival, only: %i[edit update destroy]
    def index
      @festivals = Festival.all
    end
  
    def new
      @festival = Festival.new
    end
  
    def create
      @festival = Festival.new(festival_params)
      if @festival.save
        redirect_to admin_festivals_path, notice: 'フェスが追加されました。'
      else
        render :new
      end
    end

    def edit
    end

    def update 
        @festival.update(festival_params)
        if @festival.save
            redirect_to admin_festivals_path, notice: 'フェスが更新されました。'
        else
            render :edit
        end
    end

    def destroy
        @festival.destroy
        redirect_to admin_festivals_path, notice: 'フェスが削除されました。'
    end
  
    private
  
    def festival_params
        params.require(:festival).permit(:name, :prefecture, :location, :region, { :artist_ids => [] })
    end

    def set_festival
        @festival = Festival.find(params[:id])
    end
  end
  