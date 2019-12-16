class ChangeColumnToTasks2 < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :rank, :integer, null: false
    change_column :tasks, :content, :text, null: false
    change_column :tasks, :status, :integer, null: false
  end
end
