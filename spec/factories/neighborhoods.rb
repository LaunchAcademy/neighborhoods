# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :neighborhood do
    sequence(:name) { |n| "Neighborhood #{n}" }
    description 'The best neighborhood in Boston'

    user
  end
end

