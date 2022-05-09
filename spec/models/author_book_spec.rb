require 'rails_helper'

RSpec.describe AuthorBook, type: :model do
  describe 'model specific index' do
    it { is_expected.to have_db_index(:author_id) }
    it { is_expected.to have_db_index(:book_id) }
  end
end
