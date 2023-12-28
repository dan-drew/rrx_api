require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_text/engine'
require 'action_view/railtie'
require 'jbuilder'
require 'rack/cors'
require 'actionpack/action_caching'

module RrxApi
  class Railtie < ::Rails::Engine
    initializer 'rrx.api_docs_config', before: :load_config_initializers do |_app|
      Rails.configuration.api_docs = { 'API' => 'swagger.yaml' }
    end

    initializer 'rrx.api_docs', after: :load_config_initializers do |app|
      # Setup Swagger endpoints if docs exist
      if swagger_root?
        require 'rswag/api'
        require 'rswag/ui'

        Rswag::Api.configure do |c|
          c.swagger_root = Rails.root.join('swagger')
        end
        Rswag::Ui.configure do |c|
          app.config.api_docs.each_pair do |name, file|
            c.swagger_endpoint "/api-docs/#{file}", name
          end
        end
      end
    end

    private

    def swagger_root
      @swagger_root ||= Rails.root.join('swagger')
    end

    def swagger_root?
      swagger_root.exist?
    end
  end
end
