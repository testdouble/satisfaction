require "git"

module Satisfaction
  class Client
    def initialize(path = ".")
      @git = Git.open(path)
    end

    def log
      @git.log.collect do |log|
        {:sha => log.sha, :message => log.message}
      end
    end

    def head
      head = @git.object("HEAD")
      {:sha => head.sha, :message => head.message}
    end

    def sentiments(payload = log)
      payload.map do |item|
        {
          :sha => item[:sha],
          :message => item[:message],
          :score => Satisfaction::Transmit.sentiment(item[:message]),
        }
      end
    end
  end
end
