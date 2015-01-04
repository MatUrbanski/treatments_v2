FactoryGirl.define do
  factory :patient do
    sequence(:fullname) { |n| "Patient #{n}" }
    pesel {rand(11111111111..99999999999)}
    birth_date "2014-12-16"
    address
    sex "male"

    trait :male do
      sex "male"
    end

    trait :female do
      sex "female"
    end
  end
end

