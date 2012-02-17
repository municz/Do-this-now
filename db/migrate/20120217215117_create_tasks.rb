class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :priority
      t.string :title
      t.integer :done

      t.timestamps
    end
  end
end
