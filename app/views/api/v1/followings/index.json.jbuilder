# frozen_string_literal: true

json.data do
  json.array! @followings do |following|
    json.followee_id following.followee.id
    json.followee_name following.followee.name
  end
end
