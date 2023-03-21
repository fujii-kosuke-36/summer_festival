class Artist < ApplicationRecord
    has_many :answers, dependent: :destroy
end
