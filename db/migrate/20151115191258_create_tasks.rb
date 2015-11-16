class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.timestamps null: false
      t.string :priority
      t.date :due_date
      t.string :status
      t.references :project, index: true, foreign_key: true
    end
  end
end
