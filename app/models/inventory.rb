class Inventory < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  has_many :inventory_foods

  validates :name, presence: true
end
