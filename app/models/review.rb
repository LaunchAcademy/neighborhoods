class Review < ActiveRecord::Base
  validates :description, presence: true
  validates :rating, numericality: {
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 10
    }

  belongs_to :user
  belongs_to :neighborhood
end
