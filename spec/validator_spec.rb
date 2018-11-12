require "spec_helper"
require "json"
RSpec.describe Satisfaction::Validator do
  before do
    @payload = {
      :sha => "testSHA",
      :commitMessage => "a happy commit message",
      :score => [
        {"positive" => 0.855,
         "neutral" => 0.145,
         "sentence" => "a happy commit message",
         "negative" => 0,
         "compound" => 0.7096,},
      ],
      :tags => ["yay", "fun", "test"],
    }
    @invalid_payload = {
      :commitMessage => "a happy commit message",
      :score => {},
      :tags => [],
    }
    @schema = Satisfaction::Schema.new.schemas.first
  end

  it "can validate a provided schema" do
    expect(Satisfaction::Validator.valid?(@schema, @payload.to_json)).to be(true)
  end

  it "returns false when provided an invalid schema" do
    expect(Satisfaction::Validator.valid?(@schema, @invalid_payload.to_json)).to be(false)
  end
end
