class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true
  validates :weight, inclusion: { in: [1, -1] }

  after_save :update_upvotes

  def upvote?
    weight == 1
  end

  def downvote?
    weight == -1
  end

  private

  def update_upvotes
    self.review.update_upvotes
  end
end
