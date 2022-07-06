RSpec.describe 'Index', type: :feature do
  let!(:books) { create_list(:book, 5) }
  let!(:admin) { create(:admin_user) }
  let(:book_attributes) { %i[title price authors_names] }

  before do
    visit '/admin'
    fill_in('admin_user_email', with: admin.email)
    fill_in('admin_user_password', with: admin.password)
    click_button('Login')
    click_link('Books')
  end

  scenario 'displays book attribute' do
    book_attributes.each do |attribute|
      books.map(&:decorate).map(&attribute).each do |text|
        expect(page).to have_content(text)
      end
    end
  end

  scenario 'displays book short_description' do
    books.map { |book| book.decorate.short_description }.each do |short_description|
      expect(page).to have_content(short_description)
    end
  end

  scenario 'displays book category name' do
    books.map { |book| book.category.name }.each do |category|
      expect(page).to have_content(category)
    end
  end
end
