class Food < ApplicationRecord
  has_many :inventory_foods
  has_many :recipe_foods

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end
