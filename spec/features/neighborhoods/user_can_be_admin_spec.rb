require 'rails_helper'

feature 'Admin logs in', %Q(
  As an admin, I want to be able to log in
  and see the admin links
) do

  scenario 'admin logs in successfully' do
    admin = FactoryGirl.create(:user, role: "admin")
    sign_in_as(admin)

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'Edit Users'
    expect(page).to have_content 'Pending Neighborhoods'
  end

  scenario 'admin follows edit users link and sees the right content' do
    admin = FactoryGirl.create(:user, role: "admin")
    member = FactoryGirl.create(:user)

    sign_in_as(admin)

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'Edit Users'
    click_on 'Edit Users'
    expect(page).to have_content 'Edit Users - Admin Page'
    expect(page).to have_content member.email
    expect(page).to have_content admin.email
  end

  scenario 'admin follows edit users link when there
            are no non-admin members' do
    admin = FactoryGirl.create(:user, role: "admin")
    sign_in_as(admin)

    expect(page).to have_content 'Signed in successfully.'
    expect(page).to have_content 'Edit Users'
    click_on 'Edit Users'
    expect(page).to have_content 'Currently no non-admin members'
    expect(page).to have_content admin.email
  end

  scenario 'admin can delete user' do
    admin = FactoryGirl.create(:user, role: "admin")
    member = FactoryGirl.create(:user)

    sign_in_as(admin)

    visit admin_users_path
    click_on 'Delete'
    expect(page).to have_content 'User has been deleted'

  end

  scenario 'admin can promote user to admin' do
    admin = FactoryGirl.create(:user, role: "admin")
    member = FactoryGirl.create(:user)

    sign_in_as(admin)

    visit admin_users_path
    click_on 'Promote'
    expect(page).to have_content 'User has been promoted'
  end
end

  # approve submitted neighborhoods
    # path exists
    # page contains informative title
    # page contains list of unapproved neighborhoods
    # admin sees checkbox
    # admin sees submit button
    # success or failure message
    # if successful, redirect to new neighborhood page
  # neighborhoods inline link for admin
    # page presents neighborhood details/show page in editable fields
    # delete neighborhood button
    # submit button
    # success/failure
  # reviews inline link for admin
    # page presents neighborhood details/show page in editable fields
    # delete neighborhood button
    # submit button
    # success/failure
