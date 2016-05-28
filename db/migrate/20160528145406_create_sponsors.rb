class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :facebook_url

      t.timestamps
    end
  end
end
