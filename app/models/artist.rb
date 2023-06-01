class Artist < ApplicationRecord
    has_many :answers, dependent: :destroy
    belongs_to :festival

    def self.ransackable_attributes(auth_object = nil)
        ["artist_id", "artist_image", "artist_name", "created_at", "id", "updated_at"]
    end
    
    def generate_recommendations
    require 'rspotify'
    ENV['ACCEPT_LANGUAGE'] = "ja"
    RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])
    
    artists = RSpotify::Artist.search(self.artist_name)
    if artists.any?
    seed_artist = artists.first

    related_artists = seed_artist.related_artists
    recommendations = related_artists.sample(5) # 5つのおすすめアーティストをランダムに選択

    recommendations.each do |recommendation|
        recommended_artist = OpenStruct.new(name: recommendation.name, spotify_id: recommendation.id)
    end
    end

    end
    
end
