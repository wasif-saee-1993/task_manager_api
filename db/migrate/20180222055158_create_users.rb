class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.integer :type_id
      t.integer :age
      t.string :email

      t.timestamps
    end
  end
end
