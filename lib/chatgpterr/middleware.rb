# frozen_string_literal: true

module ChatgptErr
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      response = @app.call(env)
      response
    rescue StandardError => e
      Rails.logger.error(e)
      puts "\n"
      Rails.logger.error(backtrace(e))

      puts "\nConsulting to Chatgpt ...\n"

      explanation = ChatgptErr::Explain.generate(e.message)
      explanation_ = explanation['choices'][0]['message']['content']

      raise "\n*************************\n#{explanation_}\n*************************\n"
    end

    private

    def backtrace(exception)
      exception.backtrace.select { |line| line.start_with?(Rails.root.to_s) }.map { |line| line.sub(Rails.root.to_s, '') }.join("\n")
    end
  end
end
