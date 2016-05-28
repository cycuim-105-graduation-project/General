class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :follower_id, index: true, references: :users
      t.integer :follwing_id, index: true, references: :users
      t.string :status

      t.timestamps
    end
  end
end
