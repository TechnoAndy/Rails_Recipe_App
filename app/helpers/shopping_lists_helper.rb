module ShoppingListsHelper
  def shoping_list
    @shoppinglist = []
    @recipe_foods = RecipeFood.where(recipe_id: params[:recipe_id])
    @inventory_foods = InventoryFood.where(inventory_id: params[:inventory_id])

    @recipe_foods.each do |recipe_food|
      quantity_to_shop = 0
      inventory_food = @inventory_foods.find_by(food_id: recipe_food.food_id) || nil

      if inventory_food.nil?
        quantity_to_shop = recipe_food.quantity
      elsif recipe_food.quantity > inventory_food.quantity
        quantity_to_shop = recipe_food.quantity - inventory_food.quantity
      end

      next unless quantity_to_shop.positive?

      @shoppinglist.push({ food_id: recipe_food.food_id,
                           food_name: recipe_food.food.name,
                           food_unit: recipe_food.food.measurement_unit,
                           quantity: quantity_to_shop,
                           price: recipe_food.food.price })
    end

    @shoppinglist
  end

  def total_value_of_food_needed(shoping_list)
    total = 0
    shoping_list.each do |item|
      total += item[:quantity] * item[:price]
    end

    total
  end
end
