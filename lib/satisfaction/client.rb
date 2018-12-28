require "git"

module Satisfaction
  class Client
    attr_accessor :client
    def initialize(client)
      @client = client
    end

    def messages
      @client.log.collect(&:message)
    end
  end
end
