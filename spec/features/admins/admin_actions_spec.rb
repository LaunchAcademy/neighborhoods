require 'rails_helper'

feature 'Admin visits neighborhoods dashboard', %Q(
  As admin
  I can approve, decline, delete neighborhoods.
  So that users can see them and review them
) do

  scenario 'visits admin neighborhood page' do
    admin = FactoryGirl.create(:admin_user)
    neighborhood = FactoryGirl.create(:neighborhood)
    sign_in_as(admin)
    visit admin_neighborhoods_path

    expect(page).to have_content neighborhood.name
    expect(page).to have_content "Approve"
    expect(page).to have_content "Delete"
  end

  scenario 'admin approved neighborhood' do
    admin = FactoryGirl.create(:admin_user)
    neighborhood = FactoryGirl.create(:neighborhood)
    sent_emails = ActionMailer::Base.deliveries.count


    sign_in_as(admin)
    visit admin_neighborhoods_path
    click_on 'Approve'

    expect(page).to have_content 'Neighborhood has been approved'
    expect(ActionMailer::Base.deliveries.count).to eq(sent_emails+1)
  end

  scenario 'admin deleted neighborhood' do
    admin = FactoryGirl.create(:admin_user)
    neighborhood = FactoryGirl.create(:neighborhood)
    sent_emails = ActionMailer::Base.deliveries.count

    sign_in_as(admin)
    visit admin_neighborhoods_path
    click_on 'Delete'

    expect(page).to have_content 'Neighborhood was rejected'
    expect(page).not_to have_content neighborhood.name
    expect(ActionMailer::Base.deliveries.count).to eq(sent_emails+1)
  end
end
