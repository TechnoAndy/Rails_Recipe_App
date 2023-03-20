class RecipeFood < ApplicationRecord
    belongs_to :food, foreign_key: 'food_id', class_name: 'Food'
    belongs_to :recipe, foreign_key: 'recipe_id', class_name: 'Recipe'
end
