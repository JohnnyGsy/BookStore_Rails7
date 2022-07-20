RSpec.feature 'Edit', type: :feature do
  let(:token) do
    raw, enc = Devise.token_generator.generate(User, :reset_password_token)
    { raw: raw, enc: enc }
  end
  let(:user) { create(:user) }

  before do
    user.reset_password_token = token[:enc]
    user.reset_password_sent_at = Time.now.utc
    user.save(validate: false)
    visit edit_user_password_path(reset_password_token: token[:raw])
  end

  feature 'with valid input' do
    let(:valid_password) { attributes_for(:user)[:password] }

    scenario 'authorizes user and redirect to home page' do
      fill_in(I18n.t('devise.new_password'), with: valid_password)
      fill_in(I18n.t('devise.confirm_password'), with: valid_password)
      click_button(I18n.t('devise.change_password'))
      expect(page).to have_current_path(root_path)
    end
  end

  feature 'with invalid input' do
    let(:invalid_password) { '1234' }
    let(:invalid_confirmation_password) { invalid_password.reverse }

    before do
      fill_in(I18n.t('devise.new_password'), with: invalid_password)
      fill_in(I18n.t('devise.confirm_password'), with: invalid_confirmation_password)
      click_button(I18n.t('devise.change_password'))
    end

    scenario 'stays at change password page and displays invalid confirmation password message' do
      expect(page).to have_current_path(user_password_path)
      expect(page).to have_content("doesn't match Password")
    end
  end
end
