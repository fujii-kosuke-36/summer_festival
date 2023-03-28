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

    def update
      @answer = Answer.find(params[:id])
      if @answer.update(answer_params)
        redirect_to artist_path(@artist)
      end
    end

    def destroy
     @answer = Answer.find(params[:id])
     @answer.destroy
     redirect_to artist_path(@answer.artist)
    end
    
    private
    def answer_params
      params.permit(:answer).merge(artist_id: params[:artist_id])
    end
end
