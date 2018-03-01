class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.integer :creator_id
      t.integer :assignee_id

      t.timestamps
    end
  end
end
