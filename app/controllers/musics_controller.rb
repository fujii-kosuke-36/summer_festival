class MusicsController < ApplicationController
   
#   def show
#     @song = Song.find(params[:id])
#     tracks = RSpotify::Track.search('ひたむき').first.id
#     @track = tracks.find { |track| track.artists[0].name == 'SUPER BERVER' }
#   end

 def show
    @music = music.find(params[:id])
    redirect_to artist_path(@music)
 end
    
 def new
    @artist = artist.find(params[:artist_id])
    if params[:search]
      @musics = Rspotify::Track.search(params[:search])
    end
 end

  def index
    @q = Track.ransack(params[:q])
    @tracks = @q.result(distinct :true).include
  end

end 
