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
    title_image { Rack::Test::UploadedFile.new('app/assets/images/sample_book.jpg', 'sample_book.jpg') }
    images { [Rack::Test::UploadedFile.new('app/assets/images/smashing-book-5.jpg', 'smashing-book-5.jpg')] }
  end
end
