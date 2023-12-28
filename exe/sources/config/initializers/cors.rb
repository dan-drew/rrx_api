require 'rack/cors'

LOCALHOST_PATTERN = /\Ahttp:\/\/localhost(?::\d{4})?\z/.freeze

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins do |source, env|
      if Rails.env.development?
        LOCALHOST_PATTERN.match? source
      else
        # TODO
        true
      end
    end

    resource '*',
             headers: :any,
             credentials: true,
             methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
