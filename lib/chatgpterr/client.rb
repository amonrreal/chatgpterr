# frozen_string_literal: true

require "faraday"

module ChatgptErr
  class Client
    def self.chat_completions(parameters: {})
      connection(path: '/chat/completions').post do |req|
        req.body = parameters.to_json
      end
    end

    private

    def self.config
      ChatgptErr.configuration
    end

    def self.uri
      "#{config.uri_base}#{config.api_version}"
    end

    def self.connection(path:)
      Faraday.new(
        url: "#{uri}#{path}",
        headers: headers
      )
    end

    def self.headers
      {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{config.access_token}",
        "ChatgptErr-Organization" => config.organization_id
      }
    end
  end
end