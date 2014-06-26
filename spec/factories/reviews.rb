# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review, :class => 'Reviews' do
    description 'Totally agree, one of the best places to live.'
    rating '8'

    user
    neighborhood
  end
end
