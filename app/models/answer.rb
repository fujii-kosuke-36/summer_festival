class Answer < ApplicationRecord
    belongs_to :user
    belongs_to :artist
    has_many :bookmarks, dependent: :destroy
    validates :answer, presence: true
    validates :answer, uniqueness: { scope: :artist_id }
    validates :artist_id, uniqueness: { scope: :user_id }
end
