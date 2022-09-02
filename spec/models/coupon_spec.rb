RSpec.describe Coupon, type: :model do
  context 'with validations' do
    %i[sale code].each do |property|
      it { is_expected.to validate_presence_of(property) }
    end

    it { is_expected.to validate_numericality_of(:sale).is_greater_than_or_equal_to(described_class::SALE_RANGE[:min]) }
    it { is_expected.to validate_numericality_of(:sale).is_less_than_or_equal_to(described_class::SALE_RANGE[:max]) }
  end
end
