# frozen_string_literal: true

module Api
  module V1
    class FollowingsController < ApplicationController
      before_action :set_user
      before_action :set_followee

      def index
        @followings = @user.followings
      end

      def create
        @following = @user.followings.new(following_params)
        @following.save
      end

      def destroy
        @followee.destroy
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end

      def set_followee
        @followee = @user.followings.find_by(followee_id: params[:id])

        return if @followee.present?

        render json: { message: 'Record not found', code: 'not_found' }
      end

      def following_params
        params.require(:following).permit(:follower_id, :followee_id)
      end
    end
  end
end
