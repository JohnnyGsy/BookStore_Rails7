RSpec.describe CheckoutPolicy do
  subject(:checkout) { described_class }

  let(:user) { create :user }
  let(:fake_user) { nil }

  permissions :show? do
    it 'denies access if user not present' do
      expect(checkout).not_to permit(fake_user)
    end

    it 'grants access if user present' do
      expect(checkout).to permit(user)
    end
  end
end
