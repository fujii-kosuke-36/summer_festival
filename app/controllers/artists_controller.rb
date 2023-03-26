class ArtistsController < ApplicationController
  
    def index
      @q = Artist.ransack(params[:q])
      @artists = @q.result(distinct: true).order(created_at: :asc).page(params[:page])
      @url = Artist.all
    end

    def show
      @artist = Artist.find(params[:id])
      @answers = @artist.answers.includes(:user).order(created_at: :desc)
      if current_user
        @my_answer = Answer.where(artist_id: @artist).where(user_id: current_user.id).first
      end
    end

    private
    def find_artist
      @artist = current_user.artists.find(params[:id])
    end
end