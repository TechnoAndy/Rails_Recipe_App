require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.create(name: 'User', email: '456@gmail.com', password: '123456', password_confirmation: '123456')
    @food = Food.create(name: 'Food', measurement_unit: 'kg', price: 10)
  end

  describe 'validations' do
    it 'should be valid with valid attributes' do
      expect(@food).to be_a(Food)
      expect(@food).to be_valid
    end

    it 'is valid with a name' do
      @food.name = 'Food'
      expect(@food).to be_valid
    end
  end
end
