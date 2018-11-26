class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.text :description
      t.float :geocoding
      t.references :user_id, foreign_key: true

      t.timestamps
    end
  end
end
