class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighborhood
  has_many :votes

  validates :description, presence: true
  validates :rating, inclusion: { in: 1..10 }
  validates :user_id, presence: true
  validates :neighborhood_id, presence: true
end
