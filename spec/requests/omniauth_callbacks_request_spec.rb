RSpec.describe 'OmniauthCallbacksRequest', type: :request do
  describe 'POST /users/auth/google_omniauth2' do
    let(:callback) { Faker::Omniauth.google }

    before do
      OmniAuth.config.mock_auth[:google_omniauth2] = OmniAuth::AuthHash.new(callback)
      ActionController::Base.allow_forgery_protection = false
    end

    context 'when callback is successful' do
      before do
        post user_google_oauth2_omniauth_callback_path(callback)
      end

      it 'has redirect status' do
        expect(response).to have_http_status(:redirect)
      end

      it 'with not persisted user' do
        expect(response).to redirect_to(new_user_registration_url)
      end
    end
  end
end
