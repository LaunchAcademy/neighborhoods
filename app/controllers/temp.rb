class Admin::NeighborsController < ApplicationController
  def approve_neighborhood(neighborhood)
    neighborhood.approved = true
    if neighborhood.save
      user = neighborhood.user
      NeighborhoodMailer.neighborhood_approved_email(neighborhood, user).deliver
      # flash notice
      # redirect somewhere
    else
      # flash error notice
      # redirect or render some view
    end
  end
end

