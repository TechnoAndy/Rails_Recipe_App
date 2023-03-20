class AddRecipeRefToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_foods, :recipe, null: false, foreign_key: true, index: true
  end
end
