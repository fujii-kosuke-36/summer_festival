class ArtistsController < ApplicationController
  before_action :require_login, only: :show

  def index
    @q = Artist.ransack(params[:q])
    @artists = @q.result(distinct: true).order(created_at: :asc).page(params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
    @answers = @artist.answers.includes(:user).order(created_at: :desc)
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      @artist.generate_recommendations
      redirect_to @artist
    else
      flash[:error] = "アーティストの保存に失敗しました。"
      render :new
    end
  end
  
  private

  def artist_params
    params.require(:artist).permit(:artist_name, :artist_image)
  end
  
end