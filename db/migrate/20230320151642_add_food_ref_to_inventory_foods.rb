class AddFoodRefToInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventory_foods, :food, null: false, foreign_key: true, index: true
  end
end
