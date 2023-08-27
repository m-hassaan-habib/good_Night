# frozen_string_literal: true

class SleepRecord < ApplicationRecord
  belongs_to :user

  validates :sleep_at, presence: true
  validates :wake_up_at, presence: true

  scope :by_week, -> { where('sleep_records.created_at >= ?', 1.week.ago) }
  scope :longest_first, -> { order('sleep_records.length_of_sleep DESC') }

  def length_of_sleep
    (wake_up_at - sleep_at) / 3600
  end

  def self.ordered_by_created_time
    order(created_at: :desc)
  end

  def self.for_followees(followee_ids)
    by_week.longest_first.includes(:user)
           .where(users: { id: followee_ids })
           .order('sleep_records.created_at DESC')
  end
end
