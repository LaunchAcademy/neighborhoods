require 'rails_helper'

feature 'users can add an avatar', %Q(
  As a user
  Upload an avatar
  So that everyone can see how cool I am

) do

  # Acceptance Criteria

  # When I visit the edit profile page, I am presented with a
  # file upload field, browse button, and upload button.
  # When I select a proper file and click on upload, I get a
  # success message and see the image on the page.
  # When I select the wrong file type, I get an error message
  # and can browse for another file.

  scenario 'user sees the proper field and browse and upload buttons' do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    click_on 'Edit Profile'
    within('#edit-profilemodal') do
      expect(page).to have_content 'Add an avatar'
      attach_file('user_avatar', 'spec/fixtures/avatar.jpg')
      fill_in 'Current password', with: user.password
      click_button 'Update'
    end
    user.reload

    expect(page).to have_content 'You updated your account successfully.'
    expect(page).to have_image user.avatar.url
  end
end
