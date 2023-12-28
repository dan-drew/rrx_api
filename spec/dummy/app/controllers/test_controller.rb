# frozen_string_literal: true
require 'rrx_logging'

class TestController < ApplicationController
  helper_method :some_helper

  def test
    logger.info 'Log!!!'
    render json: {
      current_logger: !!RrxLogging.current,
      logger_class: Rails.logger.class.name
    }
  end

  def some_helper
    'foo'
  end
end
