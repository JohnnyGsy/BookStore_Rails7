require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'model fields' do
    it { is_expected.to have_db_column(:name) }
  end
end
