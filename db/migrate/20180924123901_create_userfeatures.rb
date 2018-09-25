class CreateUserfeatures < ActiveRecord::Migration[5.2]
  def change
    create_table :userfeatures do |t|
      t.integer :user_id
      t.integer :gender
      t.integer :height
      t.integer :weight
      t.integer :age
      t.integer :activity
      t.integer :purpose

      t.timestamps
    end
  end
end
