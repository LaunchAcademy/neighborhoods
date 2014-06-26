require 'rails_helper'

feature 'Admin logs in', %Q(
  As an admin, I want to be able to log in
  and see the admin links
) do

  scenario 'admin logs in successfully' do
    attrs = {
      email: "dog1111@face.com",
      password: "Secret12345",
      role: "admin"
    }

    user = User.create!(attrs)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'Edit Users'
    expect(page).to have_content 'Pending Neighborhoods'
  end

  scenario 'member logs in but does not see admin links' do
  attrs = {
    email: "dog1111@face.com",
    password: "Secret12345",
  }

  user = User.create!(attrs)

  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Sign in'

  expect(page).to have_content 'Signed in successfully.'
  expect(page).not_to have_content 'Edit Users'
  expect(page).not_to have_content 'Pending Neighborhoods'
  end

  scenario 'admin follows edit users link and sees the right content' do
    attrs = {
      email: "dog1111@face.com",
      password: "Secret12345",
      role: "admin"
    }

    admin_user = User.create!(attrs)

    attrs = {
      email: "cat1111@face.com",
      password: "Secret12345",
    }

    member_user = User.create!(attrs)

    visit new_user_session_path
    fill_in 'Email', with: admin_user.email
    fill_in 'Password', with: admin_user.password
    click_button 'Sign in'

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'Edit Users'
    click_on 'Edit Users'
    # admin_user.reload
    # member_user.reload
    expect(page).to have_content 'Edit Users - Admin Page'
    expect(page).to have_content 'Admins'
    expect(page).to have_content 'Members'
    expect(page).to have_content member_user.email
    expect(page).to have_content 'Delete'
    expect(page).to have_content 'Change role'
    expect(page).to have_content admin_user.email
  end
  #scenario to go to delete link - takes visitor to edit registration page (already exists)
  #scenario to go to change role link - takes visitor to edit registration page (already exists)
end

# create a user

# Acceptance Criteria

# Admin logs in
# Admin sees "admin" links when logged in
  # list of users to promote admins
    # path exists
    # page contains informative title
    # page contains list of users and admins
    # users have checkbox for promote
    # page has button to complete promotion
    # success message or failure message
    # if successful - user is now on admin list
  # approve submitted neighborhoods
    # path exists
    # page contains informative title
    # page contains list of unapproved neighborhoods
    # admin sees checkbox
    # admin sees submit button
    # success or failure message
    # if successful, redirect to new neighborhood page

  # users
    # path exists
    # page contains title
    # admin can delete
    # submit button
    # success/failure
  #neighborhoods inline link for admin
    # page presents neighborhood details/show page in editable fields
    # delete neighborhood button
    # submit button
    # success/failure
  #reviews inline link for admin
    # page presents neighborhood details/show page in editable fields
    # delete neighborhood button
    # submit button
    # success/failure


