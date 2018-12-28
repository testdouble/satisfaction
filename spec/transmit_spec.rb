require "spec_helper"

RSpec.describe Satisfaction::Transmit do
  let(:commit_message) { "a happy commit message" }
  let(:bulk_messages) { [commit_message] }
  let(:expected_body) do
    [{"positive" => 0.855, "neutral" => 0.145, "sentence" => "a happy commit message", "negative" => 0, "compound" => 0.7096}]
  end

  subject { Satisfaction::Transmit }
  it "can transmit a commit to satisfacts", :vcr do
    result = subject.sentiment(commit_message)
    expect(result[:status_code]).to eq(200)
    expect(result[:body]).to eq(expected_body)
  end

  it "can bulk transmit multiple commits to satisfacts", :vcr do
    result = subject.bulk(bulk_messages).first

    expect(result[:status_code]).to eq 200
    expect(result[:body]).to eq(expected_body)
  end
end
