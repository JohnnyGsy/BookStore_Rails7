RSpec.feature 'books#show', type: :feature do
  let(:book) { create(:book) }

  feature 'book info' do
    before { visit book_path(book) }

    scenario 'displays title' do
      expect(page).to have_content(book.title)
    end

    scenario 'displays description' do
      expect(page).to have_content(book.description)
    end

    scenario 'displays authors_names' do
      expect(page).to have_content(book.decorate.authors_names)
    end
  end
end
