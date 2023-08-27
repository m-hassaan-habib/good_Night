# frozen_string_literal: true

if @following.errors.any?
  json.errors do
    json.array! @following.errors.full_messages do |error_message|
      json.error error_message
    end
  end
else
  json.data do
    json.follower @following.follower.name
    json.followee @following.followee.name
  end
end
