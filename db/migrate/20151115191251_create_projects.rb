class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :created_at
      t.date :due_date
      t.string :image
      t.string :status
      t.references :user, index:true, foreign_key: true
    end
  end
end
