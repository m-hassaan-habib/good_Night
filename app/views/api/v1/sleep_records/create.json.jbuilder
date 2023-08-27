# frozen_string_literal: true

if @sleep_record.errors.any?
  json.partial! 'api/v1/shared/error_messages', resource: @sleep_record
else
  json.data do
    json.user @sleep_record.user.name
    json.wake_up_at @sleep_record.wake_up_at
    json.length_of_sleep @sleep_record.length_of_sleep
  end
end
