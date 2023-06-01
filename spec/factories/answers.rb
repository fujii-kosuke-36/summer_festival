FactoryBot.define do
  factory :answer do
    sequence(:answer) { |n| "answer_#{n}" }
    association :user
    association :artist
  end
end
