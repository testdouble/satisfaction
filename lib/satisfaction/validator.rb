require "json-schema"

module Satisfaction
  class Validator
    class << self
      def valid?(schema, payload)
        JSON::Validator.validate(schema, payload)
      end
    end
  end
end
