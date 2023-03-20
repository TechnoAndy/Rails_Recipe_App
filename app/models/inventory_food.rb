class InventoryFood < ApplicationRecord
  belongs_to :food, foreign_key: 'food_id', class_name: 'Food'
  belongs_to :inventory, foreign_key: 'inventory_id', class_name: 'Inventory'
end
