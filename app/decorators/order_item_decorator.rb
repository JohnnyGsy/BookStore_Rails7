class OrderItemDecorator < Draper::Decorator
  delegate_all

  def subtotal
    book.price * quantity
  end
end
