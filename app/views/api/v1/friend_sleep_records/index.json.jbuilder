# frozen_string_literal: true

json.data do
  json.partial! 'api/v1/sleep_records/details', sleep_records: @sleep_records
end
