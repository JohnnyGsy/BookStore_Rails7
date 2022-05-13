authors = Array.new(8) { Author.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name) }
categories = Array.new(3) { Category.create!(name: Faker::Book.genre) }
30.times do |number|
  author_one = authors[number % authors.count]
  author_two = authors[number % authors.count]
  category = categories[number % categories.count]
  Book.create!(title: Faker::Book.title, category: category, description: Faker::Lorem.paragraph_by_chars, authors: [author_one, author_two])
end
