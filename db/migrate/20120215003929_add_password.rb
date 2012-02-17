class AddPassword < ActiveRecord::Migration
  def up
    add_column :users, :password, :text
  end

  def down
    remove_column :users, :password
  end
end
