FactoryGirl.define do
  factory :treatment_types_group do
    sequence(:name) { |n| "Treatment type group #{n}" }
  end
end
