require 'rails_helper'

feature 'users can search neighborhood', %Q(
  As a user
  I can search for a neighborhood
  So she can what she is looking for
) do

# Acceptance Criteria
# User finds keyword she is looking for
# User sees nothing if the the text does not exist

  scenario 'user successfully finds a query' do

    hood = FactoryGirl.create(:neighborhood)

    visit new_neighborhood_review_path(hood)
    fill_in 'Description', with: review.description
    select(review.rating, from: 'Rating')
    click_button 'Create Review'

    expect(page).to have_content 'Successfully added.'
  end
