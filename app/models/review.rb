class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :neighborhood
  has_many :votes

  validates :description, presence: true
  validates :rating, inclusion: { in: 1..10 }
  validates :user_id, presence: true
  validates :neighborhood_id, presence: true

  def vote_from(user)
    votes.find_by(user_id: user.id)
  end

  def has_vote_from?(user)
    votes.find_by(user_id: user.id).present?
  end

  def upvotes
    votes.sum(:weight)
  end

  def update_total_upvotes
    self.upvotes = votes.sum(:weight)
    save
  end
end
