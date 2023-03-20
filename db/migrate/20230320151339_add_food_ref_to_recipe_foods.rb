class AddFoodRefToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_foods, :food, null: false, foreign_key: true, index: true
  end
end
