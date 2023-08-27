# frozen_string_literal: true

if @user.errors.any?
  json.partial! 'api/v1/shared/error_messages', resource: @user
else
  json.data do
    json.name @user.name
  end
end
