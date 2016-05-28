class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.string :name
      t.text :description
      t.references :event, foreign_key: true
      t.references :agenda, foreign_key: true

      t.timestamps
    end
  end
end
