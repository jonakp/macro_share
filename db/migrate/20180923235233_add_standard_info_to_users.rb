class AddStandardInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gender, :integer
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :age, :integer
    add_column :users, :activity, :integer
    add_column :users, :purpose, :integer
  end
end
