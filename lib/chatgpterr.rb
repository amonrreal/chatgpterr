# frozen_string_literal: true

require_relative 'chatgpterr/client'
require_relative 'chatgpterr/explain'
require_relative 'chatgpterr/middleware'
require_relative 'chatgpterr/version'

module ChatgptErr
  class Error < StandardError; end
  class ConfigurationError < Error; end

  class Configuration
    attr_writer :access_token
    attr_accessor :api_version, :organization_id, :uri_base, :request_timeout

    DEFAULT_API_VERSION = 'v1'.freeze
    DEFAULT_URI_BASE = 'https://api.openai.com/'.freeze
    DEFAULT_REQUEST_TIMEOUT = 120

    def initialize
      @access_token = nil
      @api_version = DEFAULT_API_VERSION
      @organization_id = nil
      @uri_base = DEFAULT_URI_BASE
      @request_timeout = DEFAULT_REQUEST_TIMEOUT
    end

    def access_token
      return @access_token if @access_token

      error_text = 'OpenAI access token missing!'
      raise ConfigurationError, error_text
    end
  end

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= ChatgptErr::Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
