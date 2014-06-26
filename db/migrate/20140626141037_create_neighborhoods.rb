class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name, null: false
      t.text :description
      t.integer :user_id
      t.boolean :approved, default: false
      t.timestamps
    end
  end
end
