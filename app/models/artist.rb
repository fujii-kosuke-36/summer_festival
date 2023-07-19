class Artist < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :festival_artists
    has_many :festivals, through: :festival_artists

    def self.ransackable_attributes(auth_object = nil)
        ["artist_id", "artist_image", "artist_name", "created_at", "id", "updated_at"]
    end 
end
