require 'rails_helper'

feature 'users can review a neighborhood', %Q(
  As a user
  I can review a neighborhood
  So that other people know how cool/bad it is

) do

# Acceptance Criteria

# I must rate the neighborhood in my review
# I must provide a description

  scenario 'user successfully reviews a neighborhood' do
    user = FactoryGirl.create(:user)
    hood = FactoryGirl.create(:neighborhood)
    review = FactoryGirl.build(:review)

    sign_in_as(user)
    visit new_neighborhood_reviews_path(hood)
    fill_in 'Description', with: review.description
    fill_in 'Rating', with: review.rating
    click_button 'Create Rating'

    expect(page).to have_content 'Success!'
  end

  scenario 'user unsuccessfully adds neighborhood' do
    # user = FactoryGirl.create(:user)
    # hood = FactoryGirl.build(:neighborhood)

    # sign_in_as(user)
    # visit new_neighborhood_path
    # click_button 'Create Neighborhood'

    # expect(page).to have_content 'Could not save'
  end
end
