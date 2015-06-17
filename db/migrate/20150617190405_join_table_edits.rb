class JoinTableEdits < ActiveRecord::Migration
  def change
    add_column :meetups, :user_id, :integer

    remove_column :meetups, :location
    add_column :meetups, :location_id, :integer

    remove_column :meetups, :category
    add_column :meetups, :category_id, :integer

    add_column :categories, :meetup_id, :integer
    add_column :locations, :meetup_id, :integer
    add_column :users, :meetup_id, :integer
  end
end
