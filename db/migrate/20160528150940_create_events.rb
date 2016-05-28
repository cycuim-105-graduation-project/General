class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :quota
      t.references :location, foreign_key: true
      t.datetime :start_at
      t.string :end_at
      t.string :datatime

      t.timestamps
    end
  end
end
