class ChangeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :name, :string, null: false
    change_column_null :users, :email, :text, null: false
  end
end
