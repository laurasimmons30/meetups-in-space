class AddLocationId < ActiveRecord::Migration
  def change
    add_column :meetups, :location_id, :integer
  end
end
