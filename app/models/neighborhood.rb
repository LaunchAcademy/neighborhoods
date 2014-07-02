class Neighborhood < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :name, presence: true

  def average_rating
    average = reviews.average(:rating) || 0
    average.round(2)
  end

  def self.search(search)
    query = "%#{search}%"

    if search
      where('name ILIKE :name OR description ILIKE :description', name: query, description: query)
    else
      all
    end
  end
end
