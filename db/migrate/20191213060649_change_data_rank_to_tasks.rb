class ChangeDataRankToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :rank, 'integer USING CAST(rank AS integer)'
  end
end
