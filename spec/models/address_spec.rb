require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'with model fields' do
    %i[first_name last_name address city zip country phone address_type].each do |field|
      it { is_expected.to have_db_column(field) }
    end
  end

  context 'with associations' do
    it { is_expected.to belong_to(:user) }
  end
end
