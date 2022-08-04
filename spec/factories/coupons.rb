FactoryBot.define do
  factory :coupon do
    order { nil }
    code { "MyString" }
    active { false }
    sale { "9.99" }
  end
end
