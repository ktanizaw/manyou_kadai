class CreateLabel < ActiveRecord::Migration[5.2]
  def change
    create_table :labels do |t|
      t.string :name, :null => false
      t.text :content, :null => false
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
