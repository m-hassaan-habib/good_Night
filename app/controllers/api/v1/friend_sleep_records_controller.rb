# frozen_string_literal: true

module Api
  module V1
    class FriendSleepRecordsController < ApplicationController
      before_action :set_user

      def index
        @sleep_records = SleepRecord.for_followees(@user.followees.ids)
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end
    end
  end
end
