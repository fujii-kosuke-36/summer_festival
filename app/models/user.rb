class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :answers, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_answers, through: :bookmarks, source: :answer

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  enum role: { general: 0, admin: 1 }

  def own?(object)
    id == object.user_id
  end

  def bookmark(answer)
    bookmarked_answers << answer
  end

  def unbookmark(answer)
    bookmarked_answers.destroy(answer)
  end

  # bookmarkしているか判定
  def bookmark?(answer)
    answer.bookmarks.pluck(:user_id).include?(id)
  end
end
