class FestivalsController < ApplicationController
  def index
    @q = Festival.ransack(params[:q])
    @festivals = @q.result(distinct: true).order(created_at: :asc).page(params[:page])
  end

  def show
    @festival = Festival.find(params[:id])
    @artists = @festival.artists
  end
end
