class AddSpotifyIdToArtists < ActiveRecord::Migration[7.0]
  def change
    add_column :artists, :spotify_id, :string
  end
end
