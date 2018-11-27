class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :open_id
      t.text :avatar
      t.string :name

      t.timestamps
    end
  end
end

# 20181127052836_create_users
