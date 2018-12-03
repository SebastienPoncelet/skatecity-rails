class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.text :description
      t.float :longitude
      t.float :latitude
      t.text :address, default: ""
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end


# 20181126103104_create_spots
