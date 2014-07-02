require 'rails_helper'

feature 'users can search for a neighborhood', %Q(
  As a user
  I can search for a neighborhood
  So she can what she is looking for
) do

# Acceptance Criteria
# User finds keyword she is looking for
# User sees nothing if the the text does not exist

  scenario 'user successfully finds a query' do

    allston = FactoryGirl.create(:neighborhood, name: 'Allston')
    brighton = FactoryGirl.create(:neighborhood, name: 'Brighton', description: 'Next to Allston')
    southie = FactoryGirl.create(:neighborhood, name: 'South Boston', description: 'AKA Southie')

    visit neighborhoods_path
    fill_in 'q', with: allston.name
    click_button 'Search'

    expect(page).to have_content allston.name
    expect(page).to have_content brighton.name
    expect(page).not_to have_content southie.name
  end

  scenario "user searches for something that doesn't exist" do
    hood = FactoryGirl.create(:neighborhood)
    query = 'qwerty'

    visit neighborhoods_path
    fill_in 'q', with: query
    click_button 'Search'

    expect(page).to have_content "Oops, we couldn't find anything for \"#{query}.\" Please search again."
  end
end
