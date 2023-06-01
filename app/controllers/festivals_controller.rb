class FestivalsController < ApplicationController
  def index
    @q = Festival.ransack(params[:q])
    @festivals = @q.result(distinct: true).order(created_at: :asc).page(params[:page])
  end

  def show
    @festival = Festival.find(params[:id])
    if @festival.id == 10
      # アーティスト一覧を取得
      @artists = Artist.all
      # アーティストに紐づいた回答を取得（includesを使用してN+1問題を回避）
      @answers = Answer.includes(:artist).where(artist_id: @artists.pluck(:id)).order(created_at: :desc)
    end
  end
end
