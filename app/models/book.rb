class Book < ApplicationRecordhas_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
  belongs_to :category
end
