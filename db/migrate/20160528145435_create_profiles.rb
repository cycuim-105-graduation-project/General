class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :phone
      t.string :company
      t.string :position
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
