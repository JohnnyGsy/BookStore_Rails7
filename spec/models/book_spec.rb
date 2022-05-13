RSpec.describe Book, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:authors) }
    it { is_expected.to have_many(:author_books) }
  end

  describe 'model fields' do
    it { is_expected.to have_db_column(:title) }
    it { is_expected.to have_db_column(:description) }
  end

  describe 'model specific index' do
    it { is_expected.to have_db_index(:category_id) }
  end
end
