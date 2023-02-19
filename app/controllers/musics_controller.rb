class MusicsController < ApplicationController
    
  artists = RSpotify::Artist.search('SUPER BEAVER')
  
  def search
    @artists = artist.all
      if params[:search].present?
    @searchartists = RSpotify::Artist.search(params[:search])
      end
  end
end 
