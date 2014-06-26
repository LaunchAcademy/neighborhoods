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

    user = FactoryGirl.create!(:user)

    sign_in_as(user)

    click_on 'Edit Profile'

    expect(page).to have_content 'Add an avatar'
    attach_file('user_avatar', 'spec/fixtures/avatar.jpg')
    fill_in 'Current password', with: user.password
    click_button 'Update'

    user.reload

    expect(page).to have_content 'You updated your account successfully.'
    expect(page).to have_image user.avatar.url
  end
end
