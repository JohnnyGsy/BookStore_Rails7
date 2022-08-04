RSpec.describe 'Show', type: :feature do
  let(:review) { create(:review) }
  let!(:admin_attr) { attributes_for(:admin_user) }
  let(:reviews_properties) { %i[title status book_rate] }

  before do
    create(:admin_user, admin_attr)
    ActionController::Base.allow_forgery_protection = false
    visit '/admin'
    fill_in('admin_user_email', with: admin_attr[:email])
    fill_in('admin_user_password', with: admin_attr[:password])
    click_button('Login')
    visit admin_review_path(review)
  end

  feature 'review data' do
    scenario 'displays review attributes' do
      reviews_properties.each do |attribute|
        text = review.public_send(attribute)
        expect(page).to have_content(text)
      end
    end

    scenario 'displays review author email' do
      expect(page).to have_content(review.user.email)
    end

    scenario 'displays review book title' do
      expect(page).to have_content(review.book.title)
    end
  end

  feature 'approve action' do
    before { click_link(I18n.t('activeadmin.reviews.approve')) }

    scenario 'displays approve message' do
      expect(page).to have_content(I18n.t('activeadmin.reviews.approved'))
    end
  end

  feature 'reject action' do
    before { click_link(I18n.t('activeadmin.reviews.reject')) }

    scenario 'displays approve message' do
      expect(page).to have_content(I18n.t('activeadmin.reviews.rejected'))
    end
  end
end
