RSpec.feature 'New', type: :feature do
  let(:user_data) { attributes_for(:user) }

  before do
    visit new_user_session_path
    fill_in(I18n.t('devise.email'), with: user_data[:email])
    fill_in(I18n.t('devise.password'), with: user_data[:password])
  end

  feature 'with valid input' do
    before do
      create(:user, email: user_data[:email], password: user_data[:password])
      click_button(I18n.t('devise.log_in'))
    end

    scenario 'authorizes user' do
      expect(page).to have_current_path(root_path)
    end
  end

  feature 'with invalid input' do
    before do
      click_button(I18n.t('devise.log_in'))
    end

    scenario 'stays at sign in page and displays invalid credencials message' do
      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_content(I18n.t('devise.failure.not_found_in_database', authentication_keys: 'Email'))
    end
  end
end
