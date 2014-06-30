require 'rails_helper'


feature 'Admin visits neighborhoods dashboard', %Q(
  As admin
  I can approve, decline, delete neighborhoods.
  So that users can see them and review them
) do

  scenario 'visits admin neighborhood page' do

    admin = FactoryGirl.create(:admin)
    neighborhood = FactoryGirl.create(:neighborhood)

    visit admin_neighborhoods
    click_on 'Approve'

    expect(page).to have_content neighborhood.name
    expect(page).to have_content "Approve"
    expect(page).to have_content "Decline"
    expect(page).to have_content "Delete"
  end


  scenario 'admin approved neighborhood' do

    admin = FactoryGirl.create(:admin)
    neighborhood = FactoryGirl.create(:neighborhood)

    visit admin_neighborhoods
    click_on 'Approve'

    expect(page).to have_content 'Neighborhood approved'
  end

  scenario 'admin decline neighborhood' do

    admin = FactoryGirl.create(:admin)
    neighborhood = FactoryGirl.create(:neighborhood)

    visit admin_neighborhoods
    click_on 'Decline'

    expect(page).to have_content 'Neighborhood declined'
  end

  scenario 'admin deleted neighborhood' do

    admin = FactoryGirl.create(:admin)
    neighborhood = FactoryGirl.create(:neighborhood)

    visit admin_neighborhoods
    click_on 'Delete'

    expect(page).to have_content 'Neighborhood Delete'
    expect(page).not_to have_content neighborhood.name
  end
end


