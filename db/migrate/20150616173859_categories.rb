sclass Categories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false
    end
  end
end
