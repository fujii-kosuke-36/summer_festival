class FestivalsController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]
  def index
    @festivals = Festival.all
  end
  
  def new
    @festival = Festival.new
  end

  def show
    @festival = Festival.find(params[:id])
  end

  def create
    @festival = Festival.new(festival_params)
    if @festival.save
      redirect_to festivals_path
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @festival.update(festival_params)
      redirect_to festival_path
    else
      render :edit
    end
  end

  def destroy
    @festival.destroy
    redirect_to festivals_path
  end

  private
  def ensure_user
    @festivals = current_user.festivals
    @festival = @festivals.find_by(id: params[:id])
    redirect_to festivals_path unless @festival
  end
  
  def festival_params
    params.require(:festival).permit(:title, :content, :start_time, :location).merge(user_id: current_user.id)
  end
end
