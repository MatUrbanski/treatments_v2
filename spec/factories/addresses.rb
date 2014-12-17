FactoryGirl.define do
  factory :address do
    sequence(:street) { |n| "Street #{n}" }
    sequence(:city) { |n| "City #{n}" }
    sequence(:zip_code) { |n| " 12-41#{n}" }
  end
end
