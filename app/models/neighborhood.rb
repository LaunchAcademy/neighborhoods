class Neighborhood < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, presence: true

  def average_rating
    reviews.average(:rating).round(2)
  end
end
