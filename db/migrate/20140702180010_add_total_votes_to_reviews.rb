class AddTotalVotesToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :upvotes, :integer, default: 0
  end
end
