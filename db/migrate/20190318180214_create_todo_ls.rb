class CreateTodoLs < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_ls do |t|
      t.string :title

      t.timestamps
    end
  end
end
