# frozen_string_literal: true

json.data do
  json.array! @users do |user|
    json.name user.name
  end
end
