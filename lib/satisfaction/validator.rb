require "json-schema"

module Satisfaction
  # Validates a payload against a schema
  class Validator
    class << self
      def valid?(schema, payload)
        JSON::Validator.validate(schema, payload)
      end
    end
  end
end
