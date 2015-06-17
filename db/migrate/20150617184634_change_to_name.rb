class ChangeToName < ActiveRecord::Migration
  def change
    remove_column :categories, :category
    add_column :categories, :name, :string, null:false
    remove_column :locations, :location
    add_column :locations, :name, :string, null:false
    end
end
