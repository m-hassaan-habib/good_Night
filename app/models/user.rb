# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true

  has_many :sleep_records, dependent: :destroy
  has_many :followings, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :followees, through: :followings, source: :followee
  has_many :followers, class_name: 'Following', foreign_key: 'followee_id', dependent: :destroy
  has_many :follower_users, through: :followers, source: :follower

  def sleep_records_for_last_week
    sleep_records.where(created_at: 1.week.ago..Time.now).order(length_of_sleep: :desc)
  end
end
