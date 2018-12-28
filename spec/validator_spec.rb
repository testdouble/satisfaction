require "spec_helper"
require "json"
require "securerandom"
RSpec.describe Satisfaction::Validator do
  let(:payload) do
    {
      "sha" => SecureRandom.hex,
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

  let(:invalid_payload) do
    {
      "commitMessage" => "a happy commit message",
      "score" => {},
      "tags" => [],
    }
  end

  let(:schema) {Satisfaction::Schema.new.schemas.first}

  it "can validate a provided schema" do
    expect(Satisfaction::Validator.valid?(schema, payload.to_json)).to be(true)
  end

  it "returns false when provided an invalid schema" do
    expect(Satisfaction::Validator.valid?(schema, invalid_payload.to_json)).to be(false)
  end
end
