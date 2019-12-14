class ChangeColumnToUsers2 < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :name, :string, null: false
    change_column :users, :email, :text, null: false
  end
end
