require 'rails_helper'

RSpec.describe SleepRecord, type: :model do
  describe 'validations' do
    let(:user) { User.create!(name: 'Example') }
    let(:sleep_record) { user.sleep_records.create!(sleep_at: 2.weeks.ago, wake_up_at: 1.week.ago - 6.days, created_at: 2.weeks.ago) }

    it "is valid with valid attributes" do
      expect(sleep_record).to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
