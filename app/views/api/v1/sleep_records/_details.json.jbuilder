# frozen_string_literal: true

json.array! sleep_records do |sleep_record|
  json.user sleep_record.user.name
  json.wake_up_at sleep_record.wake_up_at
  json.length_of_sleep sleep_record.length_of_sleep
end
