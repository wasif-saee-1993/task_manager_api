class CreateFeedbacks < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.text :comment
      t.integer :creator_id
      t.integer :task_id

      t.timestamps
    end
  end
end
