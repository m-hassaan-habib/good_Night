require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'validations' do
    let(:follower) { User.create!(name: 'Example1') }
    let(:followee) { User.create!(name: 'Example2') }

    it "is valid with valid attributes" do
      expect(follower).to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:follower) }
    it { should belong_to(:followee) }
  end
end
