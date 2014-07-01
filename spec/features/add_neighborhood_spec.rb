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
    user = FactoryGirl.create(:user, email: "agrinb@gmail.com")
    hood = FactoryGirl.build(:neighborhood)

    sign_in_as(user)
    click_link 'Recommend Neighborhood'
    within('#new-neighborhood') do
      fill_in 'Name', with: hood.name
      fill_in 'Description', with: hood.description
      click_button('Create Neighborhood', :match => :first)
    end

    expect(page).to have_content 'Success! Your neighborhood is pending approval.'
  end

  scenario 'user unsuccessfully adds neighborhood' do
    user = FactoryGirl.create(:user)
    hood = FactoryGirl.build(:neighborhood)

    sign_in_as(user)
    visit new_neighborhood_path
    click_button('Create Neighborhood', :match => :first)

    expect(page).to have_content 'Could not save'
  end

  scenario 'site visitor attempts to add neighborhood' do

    visit new_neighborhood_path

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
