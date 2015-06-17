class RenameTable < ActiveRecord::Migration
  def change
    rename_table :categories_meetups, :categorizations
  end
end
