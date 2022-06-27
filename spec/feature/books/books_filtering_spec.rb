RSpec.feature 'Books filtering', type: :feature do
  feature 'User choose filter' do
    let(:category) { create(:category) }
    let(:another_category) { create(:category) }
    let(:books_amount) { 6 }
    let!(:category_books) { create_list(:book, books_amount, category: category) }
    let!(:another_category_books) { create_list(:book, books_amount, category: another_category) }

    before { visit books_path }

    scenario 'User can see displayed all books' do
      (category_books + another_category_books).each do |book|
        expect(page).to have_content(book.title)
      end
    end

    feature 'User selected category' do
      before { first('ul.list-inline.pt-10.mb-25.mr-240') { click_link(category.name) } }

      scenario 'User can see displayed category books' do
        category_books.each do |book|
          expect(page).to have_content(book.title)
        end
      end
    end

    feature 'with sorting' do
      let!(:books) { create_list(:book, books_amount) }

      before { visit books_path }

      scenario 'displays created_at filter first' do
        books_titles = books.sort_by(&:created_at).reverse.map(&:title)
        displayed_titles = page.all('p.title').first(books_amount).map(&:text)
        expect(books_titles).to eq displayed_titles
      end

      SortBooks::BOOK_FILTERS.except(:created_at_desc).each_key do |filter|
        scenario "displays books sorted by #{I18n.t("book.sort.#{filter}")}}" do
          within('.hidden-xs.clearfix') { click_link(I18n.t("book.sort.#{filter}")) }

          books_titles = SortBooks.new({ filter: filter }).call
                                  .limit(books_amount).decorate.map(&:title)
          displayed_titles = page.all('p.title').first(books_amount).map(&:text)

          expect(books_titles).to eq displayed_titles
        end
      end
    end
  end
end
