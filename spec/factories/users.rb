FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password "asdfqwer"

    trait :admin do
      role "admin"
    end

    factory :admin_user, traits: [:admin]
  end
end
