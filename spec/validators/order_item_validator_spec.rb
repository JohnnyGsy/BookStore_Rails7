describe OrderItemValidator do
  subject(:order_item) { OrderItem.new(book: book, quantity: quantity, order: order) }

  let(:book) { create(:book) }
  let(:order) { create(:order) }

  describe 'max_quantity' do
    context 'with valid_quantity' do
      let(:quantity) { rand(1..book.quantity) }

      it 'is valid' do
        expect(order_item).to be_valid
      end
    end

    context 'with invalid_quantity' do
      let(:quantity) { book.quantity + 5 }

      it 'is invalid' do
        expect(order_item).not_to be_valid
      end
    end
  end
end
