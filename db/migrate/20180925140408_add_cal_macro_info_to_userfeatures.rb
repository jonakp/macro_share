class AddCalMacroInfoToUserfeatures < ActiveRecord::Migration[5.2]
  def change
    add_column :userfeatures, :total_calorie, :integer
    add_column :userfeatures, :protein, :integer
    add_column :userfeatures, :fat, :integer
    add_column :userfeatures, :carbo, :integer
  end
end
