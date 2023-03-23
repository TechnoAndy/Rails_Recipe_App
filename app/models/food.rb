class Food < ApplicationRecord
  belongs_to :user, class_name: 'user', foreign_key: 'user_id'
  has_many :inventory_foods
  has_many :recipe_foods

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }
end
