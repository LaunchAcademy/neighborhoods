require 'csv'

user = FactoryGirl.create(:user, email: 'admin@neighborhoods.com', password: 'neighborhoodadmin', role: 'admin')

users = 50.times.map do
  FactoryGirl.create(:user, email: Forgery(:internet).email_address, password: 'neighborhood3')
end

neighborhoods = []
CSV.foreach("lib/data/neighborhood_data.csv", headers: true) do |row|
  neighborhoods << FactoryGirl.create(:neighborhood, name: row['name'], description: row['description'], user: users.sample, approved: true)
end

reviews = []

neighborhoods.each do |neighborhood|
  CSV.foreach("lib/data/review_data.csv", headers: true) do |row|
    reviews << FactoryGirl.create(:review, description: row['description'],
      user: users.sample, neighborhood: neighborhood, rating: rand(1..10))
  end
end

weight = [1, -1]

1000.times do
  Vote.create(user: users.sample, review: reviews.sample, weight: weight.sample)
end
