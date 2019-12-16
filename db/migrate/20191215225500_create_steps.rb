class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :task
      t.references :user
      t.string :comment
      t.integer :rating
      t.timestamps
    end
  end
end
