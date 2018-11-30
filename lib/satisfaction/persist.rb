require "fileutils"

module Satisfaction
  #Persists sentiments to a local store
  class Persist
    class << self
      def store(schema, payload, sha, path)
        File.open(sentiment_path(sha, path), "w") {|file| file.write(payload.to_json)} if Satisfaction::Validator.valid?(schema, payload)
      end

      def sentiment_path(sha, path)
        sentiment = "#{path}/#{Time.now.strftime("%Y%m%dT%H%M")}"
        FileUtils.mkdir_p sentiment
        "#{sentiment}/#{sha}.json"
      end
    end
  end
end
