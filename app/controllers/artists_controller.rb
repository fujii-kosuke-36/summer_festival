class ArtistsController < ApplicationController
  before_action :require_login, only: :show

  def index
    @q = Artist.ransack(params[:q])
    @artists = @q.result(distinct: true).order(created_at: :asc).page(params[:page])
  end

  def show
    @artist = Artist.includes(:festivals).find(params[:id])
    @festivals = @artist.festivals

    @similar_artists = []
    if @artist.spotify_id.present?
      spotify_artist = RSpotify::Artist.find(@artist.spotify_id)
      related_artist_ids = spotify_artist.related_artists.map(&:id)
      @similar_artists = Artist.where(spotify_id: related_artist_ids).limit(5)
    end
    @answers = @artist.answers.includes(:user).order(created_at: :desc)
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      @artist.generate_recommendations
      redirect_to @artist
    else
      flash[:error] = "アーティストの保存に失敗しました。"
      render :new
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:artist_name, :artist_image)
  end

end
