# frozen_string_literal: true

json.errors do
  json.array! resource.errors.full_messages do |error_message|
    json.error error_message
  end
end
