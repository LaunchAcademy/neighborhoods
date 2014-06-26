class Admin::UsersController < ApplicationController

def index
  @members = User.where(role: :member)
end

end
