class BooksController < ApplicationController
  decorates_assigned :book, :books

  def show
    @book = Book.find(params[:id])
  end

  def index
    @pagy, @books = pagy(SortBooksService.new(params).call, items: 12)
    @filters = SortBooksService::BOOK_FILTERS
    @books_count = Book.all.count
    @categories = Category.all
  end
end
