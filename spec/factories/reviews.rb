# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    sequence(:description) { |n|
      "Totally agree, of the top #{n} places to live in Boston." }
    rating 8

    user
    neighborhood
  end
end
