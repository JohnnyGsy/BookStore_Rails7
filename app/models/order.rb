class Order < ApplicationRecord
  belongs_to :user, optional: true

  has_many :order_items, dependent: :destroy
  has_many :books, through: :order_items

  has_one :coupon, dependent: :destroy

  enum status: { pending: 0, complete: 1 }, _default: 0

  scope :user_pending_order, ->(current_user) { where(status: :pending, user_id: current_user.id) }
end
