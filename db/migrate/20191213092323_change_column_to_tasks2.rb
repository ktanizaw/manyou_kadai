class ChangeColumnToTasks2 < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :rank, :string, null: false
    change_column :tasks, :content, :text, null: false
    change_column :tasks, :status, :string, null: false
  end
end
