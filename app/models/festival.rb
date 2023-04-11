class Festival < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, uniqueness: true, length: { maximum: 255 } 
  validates :content, presence: true, length: { maximum: 255 }
  validates :location, presence: true
  validates :start_time, presence: true
end
