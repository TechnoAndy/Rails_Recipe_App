class AddIndexToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_index :recipes, :description
  end
end
