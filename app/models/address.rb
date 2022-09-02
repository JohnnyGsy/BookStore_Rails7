class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  enum address_type: { billing: 0, shipping: 1 }
end
