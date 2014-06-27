require 'rails_helper'

feature 'users can upvote or downvote reviews', %Q(
  As a user
  I want to be able to upvote or downvote reviews
  So people know what's true about each neighborhood

) do

# Acceptance Criteria

# User must be logged in
# User can upvote or downvote
# User can vote only once per review
# User can change vote from up to down or down to up


  scenario 'user successfully upvotes' do
    hood = FactoryGirl.create(:neighborhood)
    user = FactoryGirl.create(:user)
    5.times do
      review = FactoryGirl.create(:review, neighborhood: hood)
    end


    sign_in_as(user)
    visit neighborhood_path(hood)
    first(:link, 'Upvote').click

    #need to check the vote_count column for reviews?
    expect(page).to have_content 'Success! Your vote has been counted.'
  end

  # scenario 'user successfully upvotes' do

  # end

  # scenario 'user successfully changes vote' do

  # end

  # scenario 'site visitor tried to vote' do

  # end


end
