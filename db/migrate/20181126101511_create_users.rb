class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :open_id
      t.string :avatar_url
      t.string :nickname

      t.timestamps
    end
  end
end
