RSpec.describe SortBooks do
  subject(:query) { described_class.new(params).call }

  let(:params) { create(:book) }

  context 'with params' do
    it 'sorts' do
      expect(query.to_sql).to include('ORDER BY "books"."created_at" DESC')
    end
  end
end
