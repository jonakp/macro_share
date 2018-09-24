class AddCalMacroInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :total_calorie, :integer
    add_column :users, :protein, :integer
    add_column :users, :fat, :integer
    add_column :users, :carbo, :integer
  end
end
