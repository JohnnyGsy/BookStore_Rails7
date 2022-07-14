require 'faker'

authors = Array.new(10) { Author.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, description: Faker::Lorem.unique.paragraph_by_chars,) }
categories = Array.new(5) { Category.create!(name: Faker::Book.unique.genre) }
30.times do |number|
  author_one = authors[number % authors.count]
  author_two = authors[number % authors.count]
  category = categories[number % categories.count]
  book = Book.create!(
    title: Faker::Book.unique.title,
    category: category,
    description: Faker::Lorem.paragraph_by_chars,
    quantity: Faker::Number.between(from: 1, to: 100),
    height: Faker::Number.decimal(l_digits: 2,r_digits: 1),
    width: Faker::Number.decimal(l_digits: 2,r_digits: 1),
    depth: Faker::Number.decimal(l_digits: 2,r_digits: 1),
    materials: Faker::Science.element,
    price: Faker::Number.decimal(l_digits: 2,r_digits: 2),
    year_of_publication: Faker::Number.between(from: 1980, to: 2020),
    authors: [author_one, author_two]
  )
  book.title_image.attach(io: File.open('app/assets/images/sample_book.jpg'), filename: 'sample_book.jpg', content_type: 'image/jpg')
  3.times do
    book.images.attach(io: File.open('app/assets/images/smashing-book-5.jpg'), filename: 'smashing-book-5.jpg', content_type: 'image/jpg')
  end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?