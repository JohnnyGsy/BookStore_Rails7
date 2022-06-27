RSpec.describe SortBooks do
  context 'with sorting' do
    let(:books_amount) { 6 }
    let!(:books) { create_list(:book, 6) }

    it 'created_at filter first' do
      sorted_books_titles = books.sort_by(&:created_at).reverse.map(&:title)
      query_titles = described_class.new({}).call.first(books_amount).map(&:title)
      expect(sorted_books_titles).to eq query_titles
    end

    SortBooks::BOOK_FILTERS.except(:created_at_desc).each_key do |filter|
      it "books sorted by #{I18n.t("book.sort.#{filter}")}}" do
        query_titles = described_class.new({ filter: filter }).call
                                      .first(books_amount).map(&:title)
        sorted_books_titles = Book.order(SortBooks::BOOK_FILTERS[filter]).first(books_amount).map(&:title)

        expect(sorted_books_titles).to eq query_titles
      end
    end
  end
end
