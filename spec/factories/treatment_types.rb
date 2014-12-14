FactoryGirl.define do
  factory :treatment_type do
    sequence(:name) { |n| "Treatment type #{n}" }
    treatment_types_group
  end
end
