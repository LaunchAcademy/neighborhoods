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
    FactoryGirl.create_list(:review, 5, neighborhood: hood)

    sign_in_as(user)
    visit neighborhood_path(hood)
    first(:button, 'Upvote').click

    votes = hood.reviews.first.votes.count
    expect(page).to have_content 'Success! Your vote has been counted.'
    expect(votes).to eq(1)
  end

  scenario 'user successfully downvotes' do
    hood = FactoryGirl.create(:neighborhood)
    user = FactoryGirl.create(:user)
    FactoryGirl.create_list(:review, 5, neighborhood: hood)

    sign_in_as(user)
    visit neighborhood_path(hood)
    first(:button, 'Downvote').click

    votes = hood.reviews.first.votes.count
    expect(page).to have_content 'Success! Your vote has been counted.'
    expect(votes).to eq(1)
  end

  scenario 'user successfully changes vote' do
    hood = FactoryGirl.create(:neighborhood)
    user = FactoryGirl.create(:user)
    FactoryGirl.create_list(:review, 5, neighborhood: hood)

    sign_in_as(user)
    visit neighborhood_path(hood)
    first(:button, 'Downvote').click
    first(:button, 'Upvote').click

    votes = hood.reviews.first.votes.count
    expect(page).to have_content 'Success! Your vote has been counted.'
    expect(votes).to eq(1)
  end

  scenario 'site visitor tried to vote' do
    hood = FactoryGirl.create(:neighborhood)
    visit neighborhood_path(hood)

    expect(page).to have_content 'Please sign in to vote on reviews.'
  end
end
