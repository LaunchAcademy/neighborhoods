require 'rails_helper'

feature 'users can add an avatar', %Q(
  As a user
  Upload an avatar
  So that everyone can see how cool I am

) do

  # Acceptance Criteria

  # When I visit the edit profile page, I am presented with a file upload field, browse button, and upload button.
  # When I select a proper file and click on upload, I get a success message and see the image on the page.
  # When I select the wrong file type, I get an error message and can browse for another file.

  scenario 'user sees the proper field and browse and upload buttons' do
    attrs = {
      email: "dog@face.com",
      password: "Secret12345",
    }

    user = User.create(attrs)

    sign_in_as(user)
    save_and_open_page

    click_on 'Edit Profile'
    expect(page).to have_content 'Add an avatar'

  end


end
