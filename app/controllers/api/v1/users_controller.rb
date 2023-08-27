# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
      end

      def create
        @user = User.create(user_params)
      end

      private

      def user_params
        params.fetch(:user, {}).permit(:name)
      end
    end
  end
end
