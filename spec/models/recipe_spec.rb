require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject { Recipe.new(name: 'recipe 1', description: 'testing recipe', cooking_time: 20, preparation_time: 30) }
  before { subject.save }

  it 'name should not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'description should  not be blank' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'cooking time should not be blank' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'cooking time should not be blank' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end
end