# yay, thanks thoughtbot...
module Satisfaction
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :sentiment_path

    def initialize
      @sentiment_path = File.join(__dir__, "../../config/")
    end
  end
end
