require "fileutils"

module Satisfaction
  class Persist
    class << self
      def store(schema, payload, sha)
        File.open(sentiment_path(sha), "w") {|file| file.write(payload.to_json)} if Satisfaction::Validator.valid?(schema, payload)
      end

      def default_path
        File.join(File.dirname(__FILE__), "../../data")
      end

      def sentiment_path(sha)
        sentiment = "#{default_path}/#{Time.now.strftime("%m_%d_%Y")}/"
        FileUtils.mkdir_p sentiment
        "#{sentiment}/#{sha}.json"
      end
    end
  end
end
