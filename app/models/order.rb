class Order < ApplicationRecord
  belongs_to :user, optional: true

  has_many :order_items, dependent: :destroy
  has_many :books, through: :order_items

  has_one :coupon, dependent: :destroy

  enum status: { address: 0, delivery: 1, payment: 2, confirm: 3, checkout_complete: 4,
                 in_delivery: 5, delivered: 6, canceled: 7 }
end
