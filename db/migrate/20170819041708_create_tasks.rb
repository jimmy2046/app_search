class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :complete
      t.string :due_date
      t.string :term

      t.timestamps
    end
  end
end
