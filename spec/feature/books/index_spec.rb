RSpec.describe 'books#index', type: :feature do
  context 'with books filtering' do
    let(:category) { create(:category) }
    let(:another_category) { create(:category) }
    let(:books_amount) { 2 }
    let!(:category_books) { BookDecorator.decorate_collection(create_list(:book, books_amount, category: category)) }

    before { visit books_path }

    context 'with selected category' do
      before { first('ul.list-inline.pt-10.mb-25.mr-240') { click_link(category.name) } }

      it 'displays category books' do
        category_books.each do |book|
          expect(page).to have_content(book.title)
        end
      end
    end
  end
end
