FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password "asdfqwer"
  end

    factory :admin, class: User do
    sequence(:email) { |n| "email#{n}@example.com" }
    password "asdfqwer"
    role "admin"
  end
end
