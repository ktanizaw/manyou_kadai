class ChangeColumnToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :rank, :string, null: false
    change_column_null :tasks, :content, :text, null: false
    change_column_null :tasks, :status, :string, null: false
  end
end
