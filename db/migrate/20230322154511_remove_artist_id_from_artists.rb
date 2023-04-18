class RemoveArtistIdFromArtists < ActiveRecord::Migration[7.0]
  def change
    remove_column :artists, :artist_id, :string
  end
end
