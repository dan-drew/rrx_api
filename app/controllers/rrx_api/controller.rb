# frozen_string_literal: true
require 'rrx_api/current'

module RRXApi
  class Controller < ActionController::API
    prepend_before_action :set_current_context

    protected

    def logger
      RRXApi::Current.logger || Rails.logger
    end

    def logging_tags
      {}
    end

    def set_current_context
      # @type [RRXApi::Logging::Logger]
      rails_logger = Rails.logger
      RRXApi::Current.logger = rails_logger.scoped(
        name: controller_name,
        tags: {
          request_id: request.request_id,
          action: action_name
        }.merge(logging_tags)
      )
    end
  end
end
