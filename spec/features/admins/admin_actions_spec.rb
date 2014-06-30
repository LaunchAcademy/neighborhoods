require 'rails_helper'

feature 'Admin visits neighborhoods dashboard', %Q(
  As admin
  I can approve, decline, delete neighborhoods.
  So that users can see them and review them
) do

  scenario 'visits admin neighborhood page' do

    admin = FactoryGirl.create(:admin)
    neighborhood = FactoryGirl.create(:neighborhood)
    sign_in_as(admin)
    visit admin_neighborhoods_path

    expect(page).to have_content neighborhood.name
    expect(page).to have_content "Approve"
    expect(page).to have_content "Delete"
  end

  scenario 'admin approved neighborhood' do

    admin = FactoryGirl.create(:admin)
    neighborhood = FactoryGirl.create(:neighborhood)

    sign_in_as(admin)
    visit admin_neighborhoods_path
    click_on 'Approve'

    expect(page).to have_content 'Neighborhood has been approved'
  end

  scenario 'admin deleted neighborhood' do

    admin = FactoryGirl.create(:admin)
    neighborhood = FactoryGirl.create(:neighborhood)

    sign_in_as(admin)
    visit admin_neighborhoods_path
    click_on 'Delete'

    expect(page).to have_content 'Neighborhood was rejected'
    expect(page).not_to have_content neighborhood.name
  end
end


