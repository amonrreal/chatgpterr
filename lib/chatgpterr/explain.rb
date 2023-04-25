# frozen_string_literal: true

require_relative 'client'

module ChatgptErr
  class Explain
    def self.generate(error_message)
      @error_message = error_message
      result = ChatgptErr::Client.chat_completions(parameters: parameters)
      response = JSON.parse(result.body)
      response
    end

    def self.prompt
      'Act as a sr developer and explain the error message to the user.'
    end

    def self.parameters
      {
        model: 'gpt-3.5-turbo',
        messages: [
          {role: 'system', content: 'Act as a sr developer and explain the error message to the user.'},
          {role: 'user', content: @error_message}
        ]
      }
    end
  end
end