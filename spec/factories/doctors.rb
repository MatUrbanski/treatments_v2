FactoryGirl.define do
  factory :doctor do
    sequence(:fullname)       { |n| "Fullname #{n}" }
    sequence(:specialization) { |n| "Specialization #{n}" }
    ordering_unit
  end
end
