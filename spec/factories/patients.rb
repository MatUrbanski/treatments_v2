FactoryGirl.define do
  factory :patient do
    sequence(:fullname) { |n| "Patient #{n}" }
    pesel "12345678901"
    birth_date "2014-12-16"
    address

    trait :male do
      sex "male"
    end

    trait :female do
      sex "female"
    end
  end
end

