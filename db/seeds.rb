require 'faker'

authors = Array.new(10) { Author.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph_by_chars,) }
categories = Array.new(5) { Category.create!(name: Faker::Book.genre) }
30.times do |number|
  author_one = authors[number % authors.count]
  author_two = authors[number % authors.count]
  category = categories[number % categories.count]
  Book.create!(
    title: Faker::Book.title,
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
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?