class CreateBeacons < ActiveRecord::Migration[5.0]
  def change
    create_table :beacons do |t|
      t.string :bid
      t.references :event, foreign_key: true
      t.references :location, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
