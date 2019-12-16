class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :status
      t.string :title
      t.string :result
      t.string :description
      t.timestamps
    end
  end
end
