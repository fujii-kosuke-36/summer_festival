class CreateFestivalArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :festival_artists do |t|
      t.references :festival, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
