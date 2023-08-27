# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { User.new(name: 'Dummy') }

    it "is valid with valid attributes" do
      expect(user).to be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:sleep_records).dependent(:destroy) }
    it { should have_many(:followings).class_name('Following').with_foreign_key('follower_id').dependent(:destroy) }
    it { should have_many(:followees).through(:followings).source(:followee) }
    it { should have_many(:followers).class_name('Following').with_foreign_key('followee_id').dependent(:destroy) }
    it { should have_many(:follower_users).through(:followers).source(:follower) }
  end

  describe '#sleep_records_for_last_week' do
    let(:user1) { User.create!(name: 'Example1') }
    let(:user2) { User.create!(name: 'Example2') }
    let(:old_sleep_records) { user1.sleep_records.create!(sleep_at: 2.weeks.ago, wake_up_at: 1.week.ago - 6.days, created_at: 2.weeks.ago) }
    let(:new_sleep_records) { user1.sleep_records.create!(sleep_at: 2.weeks.ago, wake_up_at: 1.week.ago - 6.days, created_at: 2.days.ago) }

    let(:short_sleep_record) { user2.sleep_records.create!(sleep_at: 2.weeks.ago, wake_up_at: 1.week.ago - 6.days, length_of_sleep: 5) }
    let(:long_sleep_record) { user2.sleep_records.create!(sleep_at: 2.weeks.ago, wake_up_at: 1.week.ago - 6.days, length_of_sleep: 8) }
    let(:medium_sleep_record) { user2.sleep_records.create!(sleep_at: 2.weeks.ago, wake_up_at: 1.week.ago - 6.days, length_of_sleep: 7) }

    before do
      long_sleep_record
      medium_sleep_record
      short_sleep_record
    end

    it 'returns sleep records created within the last week' do
      expect(user1.sleep_records_for_last_week).to include(new_sleep_records)
      expect(user1.sleep_records_for_last_week).to_not include(old_sleep_records)
    end

    it 'orders the sleep records by length of sleep in descending order' do
      expect(user2.sleep_records_for_last_week.first).to eq(long_sleep_record)
      expect(user2.sleep_records_for_last_week.second).to eq(medium_sleep_record)
      expect(user2.sleep_records_for_last_week.third).to eq(short_sleep_record)
    end
  end
end
