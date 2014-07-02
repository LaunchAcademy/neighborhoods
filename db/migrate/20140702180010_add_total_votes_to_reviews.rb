class AddTotalVotesToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :total_votes, :integer, default: 0
  end
end
