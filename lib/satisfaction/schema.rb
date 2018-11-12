require "json"

module Satisfaction
  class Schema
    attr_accessor :schemas

    def initialize(path = File.join(File.dirname(__FILE__), "../schemas"))
      @schemas = []
      Dir.entries(path).select {|f| !File.directory? f}.each do |source|
        schema = File.read("#{path}/#{source}")
        @schemas << JSON.parse(schema)
      end
    end
  end
end
