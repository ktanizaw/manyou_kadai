class ChangeColumnToLabels < ActiveRecord::Migration[5.2]
  def change
    change_column :labels, :name, :string, null: false
    change_column :labels, :content, :text, null: false
  end
end
