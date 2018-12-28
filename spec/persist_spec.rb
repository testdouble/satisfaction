require "spec_helper"
require "securerandom"

RSpec.describe Satisfaction::Persist do
  let(:sha) {SecureRandom.hex}
  let(:payload) do
    {
      "sha" => sha,
      "message" => "a happy commit message",
      "score" => {
        "status_code" => 200,
        "body" => [
          {"positive" => 0.855,
           "neutral" => 0.145,
           "sentence" => "a happy commit message",
           "negative" => 0,
           "compound" => 0.7096,},
        ],
      },
    }
  end

  let(:path) {File.join(__dir__, "../data")}
  let(:schema) {Satisfaction::Schema.new.schemas.first}

  subject {Satisfaction::Persist}

  it "saves sentiments to the default location" do
    subject.store(schema, payload, sha, path)
    result = JSON.parse(File.read(subject.sentiment_path(sha, path)))
    expect(result).to eq(payload)
  end
end
