require "spec_helper"

RSpec.describe Satisfaction::Transmit do
  let(:commit_message) {"a happy commit message"}
  let(:bulk_messages) {[commit_message]}
  let(:sentiment_result) do
    [
        {
            "positive" => 0.855,
            "neutral" => 0.145,
            "sentence" => "a happy commit message",
            "negative" => 0,
            "compound" => 0.7096,
        },
    ]
  end

  subject {Satisfaction::Transmit}

  it "can transmit a commit to satisfacts" do
    allow(subject).to receive(:commit).and_return(:status_code => 200, :body => sentiment_result)
    res = subject.sentiment(commit_message)
    expect(res[:status_code]).to eq(200)
    expect(res[:body]).to eq(sentiment_result)
  end

  it "can bulk transmit multiple commits to satisfacts" do
    allow(subject).to receive(:bulk).and_return([:status_code => 200, :body => sentiment_result])
    res = subject.bulk(bulk_messages)
    expect(res.length).to eq(1)
    expect(res.first[:status_code]).to eq(200)
    expect(res.first[:body]).to eq(sentiment_result)
  end
end
