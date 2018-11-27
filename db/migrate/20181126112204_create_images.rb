class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :user_id, foreign_key: true
      t.references :spot_id, foreign_key: true

      t.timestamps
    end
  end
end
