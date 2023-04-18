class Festival < ApplicationRecord
  
  
  validates :title, presence: true, uniqueness: true, length: { maximum: 255 } 
  validates :content, presence: true, length: { maximum: 255 }
  validates :location, presence: true
  validates :start_time, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "location", "name", "prefecture", "region", "updated_at"]
  end
end
