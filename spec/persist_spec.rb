require "spec_helper"

RSpec.describe Satisfaction::Persist do
  before do
    @payload = {
      "sha" => "testSHA",
      "commitMessage" => "a happy commit message",
      "score" => [
        {"positive" => 0.855,
         "neutral" => 0.145,
         "sentence" => "a happy commit message",
         "negative" => 0,
         "compound" => 0.7096,},
      ],
      "tags" => ["yay", "fun", "test"],
    }
    @sha = "testSHA"
    @schema = Satisfaction::Schema.new.schemas.first
  end

  it "saves sentiments to the default location" do
    subject = Satisfaction::Persist
    subject.store(@schema, @payload, @sha)
    result = JSON.parse(File.read(subject.sentiment_path(@sha)))
    expect(result).to eq(@payload)
  end
end
