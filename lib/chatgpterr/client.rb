module Chatgpterr
  class Client
    def initialize(access_token: nil, organization_id: nil, uri_base: nil, request_timeout: nil)
      Chatgpterr.configuration.access_token = access_token if access_token
      Chatgpterr.configuration.organization_id = organization_id if organization_id
      Chatgpterr.configuration.uri_base = uri_base if uri_base
      Chatgpterr.configuration.request_timeout = request_timeout if request_timeout
    end

    def ping
      puts "pong"
    end
  end
end