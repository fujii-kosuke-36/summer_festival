 class AnswersController < ApplicationController
    before_action :require_login
    def new
      @artist = Artist.find(params[:artist_id])
      if params[:search]
        @songs = RSpotify::Track.search(params[:search]).first(10) unless params[:search].empty?
        if current_user
          @my_answer = Answer.where(artist_id: @artist).where(user_id: current_user.id).first
        end
      end
    end
    
    def create
      @answer = current_user.answers.build(answer_params)
      if @answer.save
        redirect_to artist_path(@answer.artist)
      end
    end
    
    private
    def answer_params
      params.permit(:answer, :artist_id).merge(user_id: current_user.id)
    end
end
