class RenameTableUsermeetups < ActiveRecord::Migration
  def change
    rename_table :users_meetups, :usermeetups
  end
end
