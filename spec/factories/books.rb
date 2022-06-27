FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    price { Faker::Number.decimal(l_digits: 2) }
    quantity { Faker::Number.between(from: 1, to: 100) }
    description { Faker::Lorem.paragraph_by_chars }
    year_of_publication { Faker::Number.between(from: 1, to: 100) }
    height { Faker::Number.decimal(l_digits: 1) }
    width { Faker::Number.decimal(l_digits: 1) }
    depth { Faker::Number.decimal(l_digits: 1) }
    materials { Faker::Science.element }
    authors { create_list(:author, 2) }
    category
  end
end
