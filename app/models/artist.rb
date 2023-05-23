class Artist < ApplicationRecord
    has_many :answers, dependent: :destroy
    belongs_to :festival
    
    def self.ransackable_attributes(auth_object = nil)
        ["artist_id", "artist_image", "artist_name", "created_at", "id", "updated_at"]
    end
end
