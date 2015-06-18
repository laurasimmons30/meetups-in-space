class Removedate < ActiveRecord::Migration
  def change
    remove_column :meetups, :date
  end
end
