class Review < ActiveRecord::Base
  validates :description, presence: true
  validates :rating, inclusion: { in: 1..10 }
  validates :user_id, presence: true
  validates :neighborhood_id, presence: true

  belongs_to :user
  belongs_to :neighborhood
end
