FactoryGirl.define do
  factory :ordering_unit do
    sequence(:name) { |n| "Ordering Unit #{n}" }
    address
  end
end
