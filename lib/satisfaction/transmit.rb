require "faraday"
require "json"

module Satisfaction
  # Transmits data to the satisfacts server
  class Transmit
    class << self
      def sentiment(message)
        res = connect.post { |req|
          req.url ENV["SENTIMENT_API_ENDPOINT"]
          req.headers["Content-Type"] = "application/json"
          req.body = {:commit => message}.to_json
        }
        {:status_code => res.status, :body => JSON.parse(res.body)}
      end

      def bulk(messages)
        messages.collect do |message|
          sentiment(message)
        end
      end

      def connect
        Faraday.new(:url => ENV["SENTIMENT_API_URL"])
      end
    end
  end
end
