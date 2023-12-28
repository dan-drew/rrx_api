# frozen_string_literal: true

module RrxApi
  class Record < ActiveRecord::Base
    self.abstract_class = true

    # @return [RrxLogging::Logger]
    def logger
      @logger ||= RrxLogging.current || Rails.logger
    end
  end
end
