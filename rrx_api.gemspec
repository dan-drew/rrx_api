# frozen_string_literal: true

require_relative "lib/rrx_api/version"

Gem::Specification.new do |spec|
  spec.name = "rrx_api"
  spec.version = RRXApi::VERSION
  spec.authors = ["Dan Drew"]
  spec.email = ["dan.drew@hotmail.com"]

  spec.summary = "TODO: Write a short summary, because RubyGems requires one."
  spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'actionpack-action_caching'
  spec.add_dependency 'bootsnap'
  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'jbuilder'
  spec.add_dependency 'kaminari'
  spec.add_dependency 'puma'
  spec.add_dependency 'rack-cors'
  spec.add_dependency 'rails', RRXApi::RAILS_VERSION
  spec.add_dependency 'rails-healthcheck'
  spec.add_dependency 'rswag-api'
  spec.add_dependency 'rswag-ui'
  spec.add_dependency 'tzinfo-data' # Windows does not include zoneinfo files, so bundle the tzinfo-data gem

  spec.add_development_dependency 'rrx_dev'
end
