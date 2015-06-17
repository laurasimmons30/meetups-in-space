class Usermeetups < ActiveRecord::Migration
  def change
    create_table 'users_meetups', :id => false do |t|
      t.column :user_id, :integer
      t.column :meetup_id, :integer
    end
  end
end
