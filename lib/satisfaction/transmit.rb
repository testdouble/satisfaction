require "faraday"
require "json"

module Satisfaction
  # Transmits data to the satisfacts server
  class Transmit
    class << self
      def commit(message)
        res = connect.post { |req|
          req.url "/test"
          req.headers["Content-Type"] = "application/json"
          req.body = {:commit => message}.to_json
        }
        {:status_code => res.status, :body => JSON.parse(res.body)}
      end

      def connect
        Faraday.new(:url => ENV["SENTIMENT_API_ENDPOINT"])
      end
    end
  end
end
