class Festival < ApplicationRecord
  has_many :festival_artists
  has_many :artists, through: :festival_artists

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "location", "name", "prefecture", "region", "updated_at"]
  end
end
