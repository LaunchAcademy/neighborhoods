class User < ActiveRecord::Base
  has_many :neighborhoods
  has_many :reviews
  has_many :votes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader

  def admin?
    role == 'admin'
  end
end
