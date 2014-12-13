FactoryGirl.define do
  factory :address do
    sequence(:street) { |n| "Street #{n}" }
    sequence(:city) { |n| "City #{n}" }
    sequence(:zip_code) { |n| " 123-4#{n}" }
  end
end
