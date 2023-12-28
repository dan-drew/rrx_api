# frozen_string_literal: true
require 'rrx_api/current'

module RRXApi
  class Record < ActiveRecord::Base
    # @return [RRXApi::Logging::Logger]
    def logger
      @logger ||= RRXApi::Current.logger || base.logger
    end
  end
end
