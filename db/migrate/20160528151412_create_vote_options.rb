class CreateVoteOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :vote_options do |t|
      t.text :content
      t.references :vote, foreign_key: true

      t.timestamps
    end
  end
end
