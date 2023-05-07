class ArtistsController < ApplicationController
  before_action :require_login, except: [:index]
  def index
    @q = Artist.ransack(params[:q])
    @artists = @q.result(distinct: true).order(created_at: :asc).page(params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
    @answers = @artist.answers.includes(:user).order(created_at: :desc)
  end
end