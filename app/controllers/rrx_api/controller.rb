# frozen_string_literal: true

module RrxApi
  class Controller < ActionController::API
    include AbstractController::Helpers

    abstract!

    # @return [RrxLogging::Logger]
    def logger
      RrxLogging.current || Rails.logger
    end
  end
end
