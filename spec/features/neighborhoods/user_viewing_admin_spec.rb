feature 'functionality related to users viewing restricted areas' do

  scenario 'member logs in but does not see admin links' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    expect(page).to have_content 'Signed in successfully.'
    expect(page).not_to have_content 'Edit Users'
    expect(page).not_to have_content 'Pending Neighborhoods'
  end

  scenario 'member logs in and tries to point to restricted url' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit admin_users_path
    expect(page).to have_content 'not authorized'
    expect(page).not_to have_content 'Edit Users'
  end
end
