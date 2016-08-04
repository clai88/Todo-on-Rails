class AddCompletedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :is_completed, :datetime
  end
end
