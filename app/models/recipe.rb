class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  has_many :recipe_foods

  validates :name, presence: true
  validates :description, presence: true

  def total_food_items
    recipe_foods.count
  end

  def total_price
    total = 0
    recipe_foods.each do |recipe_food|
      total += recipe_food.quantity * recipe_food.food.price
    end
    total
  end

  def own?
    user_id == current_user.id
  end
end
