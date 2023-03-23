require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  inventory = Inventory.first
  food = Food.first
  subject { InventoryFood.new(quantity: 'test inventory', inventory:, food:) }
  before { subject.save }

  it 'name should not be blank' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end
end