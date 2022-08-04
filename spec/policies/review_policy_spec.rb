RSpec.describe ReviewPolicy do
  subject(:review) { described_class }

  let(:user) { create :user }
  let(:fake_user) { nil }

  permissions :create? do
    it 'denies access if user not present' do
      expect(review).not_to permit(fake_user)
    end

    it 'grants access if user present' do
      expect(review).to permit(user)
    end
  end
end
