require 'rails_helper'

feature 'users can add a neighborhood', %Q(
  As a user
  Recommend a neighborhood to the admin
  So that he can open it

) do

# Acceptance Criteria

# I must provide a name
# I must be signed in to recommend a neighborhood
# I can provide details about the neighborhood

  scenario 'user successfully adds neighborhood' do

    user = FactoryGirl.create(:user)

    sign_in_as(user)

    hood = FactoryGirl.build(:neighborhood)

    visit new_neighborhood_path
    fill_in 'Name', with: hood.name
    fill_in 'Description', with: hood.description
    click_button 'Submit'


    expect(page).to have_content 'Successfully added.'
    expect(page).to have_content 'Pending admin approval.'

  end
end
