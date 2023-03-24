require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.new(name: 'Andy', email: 'atdiegaardt@gmail.com', password: 'Zoeli@143',
                     password_confirmation: 'Zoeli@143')
    @user.save
  end

  it 'is valid' do
    recipe = Recipe.new(name: 'Chicken Curry', preparation_time: '120', cooking_time: '90',
                        description: 'Test', public: false, user: @user)
    expect(recipe).to be_valid
  end

  it 'is not valid without a name' do
    recipe = Recipe.new(name: nil, preparation_time: '120', cooking_time: '90',
                        description: 'Test', public: false, user: @user)
    expect(recipe).to_not be_valid
  end

  # it 'is not valid without a preparation time' do
  #   recipe = Recipe.new(name: 'Chicken Curry', description: 'Test', preparation_time: nil, cooking_time: '90',
  #      public: false, user: @user)
  #   expect(recipe).to_not be_valid
  # end

  # it 'is not valid without a cooking time' do
  #   recipe = Recipe.new(name: 'Chicken Curry', description: 'Test', preparation_time: '5 minutes', cooking_time: nil,
  #      public: false, user: @user)
  #   expect(recipe).to_not be_valid
  # end

  it 'is not valid without a description' do
    recipe = Recipe.new(name: 'Chicken Curry', preparation_time: '120', cooking_time: '2 hours',
                        description: nil, public: false, user: @user)
    expect(recipe).to_not be_valid
  end
end
