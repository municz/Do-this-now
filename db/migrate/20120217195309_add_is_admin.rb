class AddIsAdmin < ActiveRecord::Migration
  def up
    add_column :users, :is_admin, :integer
  end

  def down
    remove_column :users, :is_admin
  end
end
