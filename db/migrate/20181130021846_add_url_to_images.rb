class AddUrlToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :url, :text
  end
end
