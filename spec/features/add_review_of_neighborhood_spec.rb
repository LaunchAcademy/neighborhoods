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
    visit new_neighborhood_review_path(hood)
    within('.dogface') do
      fill_in 'Description', with: review.description
      select(review.rating, from: 'Rating')
    end
    click_button 'Create Review'
    expect(page).to have_content 'Successfully added.'
  end

  scenario 'user unsuccessfully adds review' do
    user = FactoryGirl.create(:user)
    hood = FactoryGirl.create(:neighborhood)

    sign_in_as(user)
    visit new_neighborhood_review_path(hood)
    click_button 'Create Review'

    expect(page).to have_content 'Could not save.'
  end

  scenario 'visitor attempts to add review' do
    hood = FactoryGirl.create(:neighborhood)

    visit new_neighborhood_review_path(hood)

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
