# frozen_string_literal: true

module Api
  module V1
    class SleepRecordsController < ApplicationController
      before_action :set_user

      def index
        @sleep_records = @user.sleep_records.by_week.longest_first.ordered_by_created_time
      end

      def create
        @sleep_record = @user.sleep_records.create(sleep_record_params)
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end

      def sleep_record_params
        params.fetch(:sleep_record, {}).permit(:sleep_at, :wake_up_at)
      end
    end
  end
end
