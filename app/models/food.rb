class Food < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  has_many :inventory_foods
  has_many :recipe_foods

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end
