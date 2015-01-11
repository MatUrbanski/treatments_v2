FactoryGirl.define do
  factory :treatment do
    patient
    doctor
    treatment_type
    sequence(:medicine) { |n| "medicine#{n}" }
    start_days 40
  end
end
