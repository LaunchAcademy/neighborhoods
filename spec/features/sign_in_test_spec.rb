require 'rails_helper'

feature 'user signs up or registers', %Q{
  As a user
  I want to sign up
  So that I can review some neighborhoods

} do

# Acceptance Criteria

# I must provide my username/email and password
# I can optionally provide my first name, last name, city, and state
# I am presented with a success message if I sign up successfully
# I'm presented with errors if I provide invalid credentials

  scenario 'user signs up successfully' do
    attrs = {
      email: "dog@face.com",
      password: "Secret1"
    }

    user = User.new(attrs)

    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Submit'

    expect(page).to have_content 'Success!'

  end

  scenario 'user gets error message if username missing' do

  end

  scenario 'user gets error message if password missing'

  scenario 'user gets error message if invalid credentials'

  end
