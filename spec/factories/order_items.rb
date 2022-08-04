FactoryBot.define do
  factory :order_item do
    book { nil }
    order { nil }
    quantity { 1 }
  end
end
