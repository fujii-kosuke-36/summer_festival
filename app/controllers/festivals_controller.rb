class FestivalsController < ApplicationController
  def index
    @q = Festival.ransack(params[:q])
    @festivals = @q.result(distinct: true).order(created_at: :asc).page(params[:page])
    
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
      redirect_to festivals_path, notice: "投稿しました"
    else
      render 'new'
    end
  end

  def destroy
    @festival = Festival.find(params[:id])
    if @festival.destroy
      redirect_to festivals_path, notice:"削除しました"
    else
      render :edit
    end
  end

  def edit
    @festival = Festival.find(params[:id])
  end

  def update
    @festival = Festival.find(params[:id])
    if @festival.update(festival_params)
      redirect_to festivals_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private
  
  #user_idを入れる
  def festival_params
    params.require(:festival).permit(:title, :content, :start_time, :location).merge(user_id: current_user.id)
  end

end
