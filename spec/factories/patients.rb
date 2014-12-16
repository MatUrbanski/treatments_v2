FactoryGirl.define do
  factory :patient do
    sequence(:fullname) { |n| "Patient #{n}" }
    pesel "12345678901"
    birth_date "2014-12-16"

    trait :male do
      sex "Male"
    end

    trait :female do
      sex "Female"
    end
  end
end

