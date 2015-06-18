class Removeids < ActiveRecord::Migration
  def change
    remove_column :categories, :meetup_id
    remove_column :locations, :meetup_id
    remove_column :meetups, :user_id
    remove_column :meetups, :location_id
    remove_column :meetups, :category_id
    remove_column :users, :meetup_id
  end
end
