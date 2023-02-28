class ArtistsController < ApplicationController
  
    def index
      @q = Theme.ransack(params[:q])
      @artists = @q.result(distinct: true).includes(:user).page(params[:page])
    end

    def show
      @artist = artist.find(params[:id])
      @musics = @artist.musics.includes(:user)
    end
    
end
