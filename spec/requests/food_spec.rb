require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create(name: 'cake', email: 'cake@mail.com', password: 'password') }
  let(:food) { user.foods.create(name: 'apple', measurementUnit: 'kg', price: 4) }

  describe 'GET /index' do
    before do
      get foods_path
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET /new' do
    before do
      sign_in user
      get new_food_path
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end