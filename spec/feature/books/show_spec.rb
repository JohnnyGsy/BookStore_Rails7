RSpec.describe 'books#show', type: :feature do
  let(:book) { create(:book) }

  describe 'book info' do
    before { visit book_path(book) }

    it 'displays title' do
      expect(page).to have_content(book.title)
    end

    it 'displays description' do
      expect(page).to have_content(book.description)
    end

    it 'displays authors_names' do
      expect(page).to have_content(book.decorate.authors_names)
    end
  end
end
