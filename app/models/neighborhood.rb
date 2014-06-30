class Neighborhood < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, presence: true

  def average_rating
    average = reviews.average(:rating) || 0
    average.round(2)
  end
end
