require 'rails_helper'

RSpec.describe Inventory, type: :model do
  user = User.first
  subject { Inventory.new(name: 'test inventory', user:) }
  before { subject.save }

  it 'name should not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
