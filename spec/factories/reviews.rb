# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    sequence(:description) do |n|
      "Totally agree, of the top #{n} places to live in Boston."
    end
    rating 8

    user
    neighborhood
  end
end
