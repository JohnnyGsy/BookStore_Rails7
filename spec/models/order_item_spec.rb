RSpec.describe OrderItem, type: :model do
  context 'with associations' do
    %i[book order].each do |association|
      it { is_expected.to belong_to(association) }
    end
  end
end
