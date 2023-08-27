# frozen_string_literal: true

module ErrorConcern
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

    def render_errors(errors, status = :bad_request)
      response_errors = Array.wrap(errors).map do |error|
        {
          error_code: error[:code],
          error_message: error[:message]
        }
      end

      render json: { errors: response_errors }, status: status
    end

    def i18n_errors(error_key)
      I18n.t("error_messages.#{error_key}")
    end

    def resource_not_found
      render_errors({ code: 'not_found', message: i18n_errors('not_found') }, :not_found)
    end
  end
end
