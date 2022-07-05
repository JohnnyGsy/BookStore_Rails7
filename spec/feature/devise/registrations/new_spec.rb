RSpec.feature 'New', type: :feature do
  let(:user_data) { attributes_for(:user) }

  before do
    visit new_user_registration_path
  end

  feature 'with valid input' do
    before do
      fill_in(I18n.t('devise.email'), with: user_data[:email])
      fill_in(I18n.t('devise.password'), with: user_data[:password])
      fill_in(I18n.t('devise.confirm_password'), with: user_data[:password])
      click_button(I18n.t('devise.sign_up'))
    end

    scenario 'registers user' do
      expect(page).to have_current_path(root_path)
    end
  end

  feature 'with invalid input' do
    let(:invalid_email) { 'wertfds' }
    let(:invalid_password) { '12341234' }
    let(:invalid_confirmation_password) { invalid_password.reverse }

    before do
      fill_in(I18n.t('devise.email'), with: invalid_email)
      fill_in(I18n.t('devise.password'), with: invalid_password)
      click_button(I18n.t('devise.sign_up'))
    end

    scenario 'stays at sign up page displays invalid email/password/confirmation password message' do
      expect(page).to have_current_path(user_registration_path)
      expect(page).to have_content('Passwordmust contain at least 1 uppercase, at least 1 lowercase, at least 1 number')
      expect(page).to have_content("doesn't match Password")
    end
  end
end
