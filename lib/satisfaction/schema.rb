require "json"

module Satisfaction
  # loads Schemas for satisfacts results
  class Schema
    attr_accessor :schemas

    def initialize(path = File.join(__dir__, "../schemas"))
      @schemas = []
      Dir.entries(path).select {|f| !File.directory? f}.each do |source|
        schema = File.read("#{path}/#{source}")
        @schemas << JSON.parse(schema)
      end
    end
  end
end
