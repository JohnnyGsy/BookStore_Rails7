RSpec.feature 'Books filtering', type: :feature do
  feature 'User choose filter' do
    let(:category) { create(:category) }
    let(:another_category) { create(:category) }
    let(:books_amount) { 2 }
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
  end
end
