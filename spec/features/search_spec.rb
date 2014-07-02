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

    visit neighborhoods_path
    fill_in 'q', with: hood.name
    click_button 'Search'

    expect(page).to have_content hood.name
  end

  scenario "user searches for something that doesn't exist" do

    hood = FactoryGirl.create(:neighborhood)

    visit neighborhoods_path
    fill_in 'q', with: 'qwerty'
    click_button 'Search'

    expect(page).not_to have_content 'Read the reviews'
  end

end
