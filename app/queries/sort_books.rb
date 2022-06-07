class SortBooks
  BOOK_FILTERS = {
    created_at_desc: { created_at: :desc },
    popular_asc: { created_at: :desc },
    price_asc: { price: :asc },
    price_desc: { price: :desc },
    title_asc: { title: :asc },
    title_desc: { title: :desc }
  }.freeze

  def initialize(params)
    @category_id = params[:category_id]
    @filter = params[:filter]&.to_sym || :created_at_desc
    @books = @category_id ? Book.where(category_id: @category_id) : Book.all
  end

  def call
    order_by_filter
  end

  private

  def order_by_filter
    @books.order(BOOK_FILTERS[@filter])
  end
end
