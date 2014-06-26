class Neighborhood < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, presence: true
end
