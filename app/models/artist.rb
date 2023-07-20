class Artist < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :festival_artists
    has_many :festivals, through: :festival_artists

    def self.ransackable_attributes(auth_object = nil)
        ["artist_id", "artist_image", "artist_name", "created_at", "id", "updated_at"]
    end

    def fetch_spotify_data
        return if spotify_id.present?

        spotify_artist = RSpotify::Artist.search(artist_name).first

        if spotify_artist
          self.spotify_id = spotify_artist.id
          save
        end
      rescue RestClient::NotFound => e
        # Spotifyからアーティスト情報が見つからない場合の処理
        Rails.logger.error "Artist '#{artist_name}' not found on Spotify: #{e.message}"
    end

end
