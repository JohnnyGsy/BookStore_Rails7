FactoryBot.define do
  factory :review do
    book_rate { rand(0..5) }
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph_by_chars }
    status { Review.statuses[:approved] }
    user { nil }
    book { nil }
  end
end
