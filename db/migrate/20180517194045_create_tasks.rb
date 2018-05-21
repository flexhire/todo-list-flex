class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name,       null: false
      t.date :due_date,     null: false
      t.integer :priority
      t.integer :user_id
      t.boolean :doit,      null: false, default: false

    end
  end
end
