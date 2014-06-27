feature 'functionality related to users viewing restricted areas' do

  scenario 'member logs in but does not see admin links' do
    attrs = {
      email: 'dog1111@face.com',
      password: 'Secret12345',
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

  scenario 'member logs in and tries to point to restricted url' do
    attrs = {
      email: 'dog1111@face.com',
      password: 'Secret12345',
    }

    user = User.create!(attrs)

    visit admin_users_path
    expect(page).to have_content 'not authorized'
    expect(page).not_to have_content 'Edit Users'
  end
end
