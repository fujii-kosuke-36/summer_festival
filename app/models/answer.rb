class Answer < ApplicationRecord
    belongs_to :user
    belongs_to :artist
    validates :answer, presence: true
    validates :answer, uniqueness: { scope: :artist_id }
    validates :artist_id, uniqueness: { scope: :user_id }
    #scope :answered, -> { order(id: :desc).limit(3)}
end
