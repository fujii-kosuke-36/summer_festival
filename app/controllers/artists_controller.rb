class ArtistsController < ApplicationController
  
    def index
      @artist = artist.all.includes(:result).page(params[:page])
    end

    def show
      @artist = artist.find(params[:id])
      @musics = @artist.musics.includes(:user)
    end
    
end
