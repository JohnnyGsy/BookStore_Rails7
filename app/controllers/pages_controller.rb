class PagesController < ApplicationController
  LATEST_BOOKS_AMOUNT = 3

  decorates_assigned :latest_books

  def index
    @latest_books = Book.last(LATEST_BOOKS_AMOUNT)
  end
end
