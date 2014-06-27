class NeighborhoodMailer < ActionMailer::Base
  default from: "alek@example.com"

#email to admin to approve neighborhood
   def new_neighborhood_email(neighborhood)
    @neighborhood = neighborhood
    @admin = Admin.find_by email: 'agrinb@gmail.com'
    mail(to: @admin.email, subject: 'New Neighborhood Submitted')
  end

#emails to neighborhood poster
  def neighborhood_approved_email(neighborhood)
    @neighborhood = neighborhood
    @user = @neighborhood.user
    mail(to: @user.email, subject: '@neighborhood.name Aprroved')
  end

  def neighorhood_declined_email(neighborhood)
    @neighborhood = neighborhood
    @user = @neighborhood.user
    mail(to: @user.email, subject: '@neighborhood.name Declined')
  end

  def neighorhood_review_email(neighborhood)
    @neighborhood = neighborhood
    @user = @neighborhood.user
    mail(to: @user.email, subject: '@neighborhood.name received a review')
  end
end
