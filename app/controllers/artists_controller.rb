class ArtistsController < ApplicationController

  def index
    @q = Artist.ransack(params[:q])
    @artists = @q.result(distinct: true).order(created_at: :asc).page(params[:page])
    @url = Artist.all
  end
  def show
    @artist = Artist.find(params[:id])
    @answers = @artist.answers.order(created_at: :desc)
    #おすすめ曲を表示するためのコード
  end
end