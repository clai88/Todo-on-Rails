class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :list_id
      t.date :due_on


      t.timestamps null: false
    end
  end
end
