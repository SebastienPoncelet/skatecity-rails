class AddCachedVotesToSpot < ActiveRecord::Migration[5.2]
  def change
    change_table :spots do |t|
      t.integer :cached_votes_total, default: 0
    end
  end
end
