require 'rails_helper'

describe Vote do
  describe "#upvote?" do
    it "is true when weight is 1" do
      vote = Vote.new(weight: 1)
      expect(vote).to be_upvote
    end

    it "is false when weight is not 1" do
      vote = Vote.new(weight: -1)
      expect(vote).to_not be_upvote
    end
  end

  describe "#downvote?" do
    it "is true when weight is -1" do
      vote = Vote.new(weight: -1)
      expect(vote).to be_downvote
    end

    it "is false when weight is not -1" do
      vote = Vote.new(weight: 10)
      expect(vote).to_not be_downvote
    end
  end
end
