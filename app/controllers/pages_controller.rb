class PagesController < ApplicationController
  LATEST_BOOKS_AMOUNT = 3

  def index
    @latest_books = BookDecorator.decorate_collection(latest_books)
  end

  private

  def latest_books
    Book.last(LATEST_BOOKS_AMOUNT)
  end
end
