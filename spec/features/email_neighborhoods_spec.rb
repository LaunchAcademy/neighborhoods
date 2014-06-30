# require 'rails_helper'

# feature 'email gets triggered', %Q(
#   As admin
#   I want to receive approval emails
#   so I can decline spam
# ) do

#   scenario 'dispatches admin when neighborhood is created' do
#     #clear out mail deliveries
#     ActionMailer::Base.deliveries = []

#     prev_count = Neighborhood.count
#     user = FactoryGirl.create(:user)
#     hood = FactoryGirl.build(:neighborhood)
#     #admin = FactoryGirl.create(:admin)

#     sign_in_as(user)
#     visit new_neighborhood_path
#     fill_in 'Name', with: hood.name
#     fill_in 'Description', with: hood.description

#     # upon registering, a confirmation email should be delivered,
#     # so ActionMailer::Base.deliveries should include the email:
#     expect(ActionMailer::Base.deliveries.size).to eql(1)

#     # the email we just sent should have the proper subject and recipient:
#     last_email = ActionMailer::Base.deliveries.last
#     expect(last_email).to have_subject('New Neighborhood Submission')
#     #(last_email).to deliver_to(admin.email)
#   end
# end
