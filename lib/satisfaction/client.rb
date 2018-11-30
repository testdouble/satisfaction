require "git"

module Satisfaction
  class Client
    attr_accessor :client
    def initialize(client)
      @client = client
    end

    def messages
      @client.log.collect {|log| log.message }
    end

  end
end
