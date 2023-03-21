class ArtistsController < ApplicationController
  
    def index
      @q = Artist.ransack(params[:q])
      # @artists = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
      @artists = Artist.all
      @artists = Artist.order(created_at: :asc).page(params[:page]).per(20)
      @url = Artist.all
    end

    def show
      @artist = Artist.find(params[:id])
      # @answers = @artist.answers.includes(:user).order(created_at: :desc)
    if current_user
      @my_answer = Answer.where(artist_id: @artist).where(user_id: current_user.id).first
    end
    end
    
end
