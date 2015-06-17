class Categorizations < ActiveRecord::Migration
  def change
    create_table 'categories_meetups', :id => false do |t|
      t.column :category_id, :integer
      t.column :meetup_id, :integer
    end
  end
end
