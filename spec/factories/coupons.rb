FactoryBot.define do
  factory :coupon do
    order
    code { Faker::String.random(length: 4..10) }
    active { true }
    sale { Faker::Number.between(from: 0.0, to: 1.0) }
  end
end
