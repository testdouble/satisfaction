require 'spec_helper'

RSpec.describe Satisfacts do
  before do
    @commit_message = 'a happy commit message'
    @sentiment_result = [
        {'positive' => 0.855,
         'neutral' => 0.145,
         'sentence' => 'a happy commit message',
         'negative' => 0,
         'compound' => 0.7096}
    ]
    allow_any_instance_of(Satisfacts::Transmit).to receive(:commit).and_return(:status_code => 200, :body => @sentiment_result)
  end

  it 'can transmit a sentiment to satisfacts' do
    res = Satisfacts::Transmit.commit(@commit_message)
    expect(res[:status_code]).to eq(200)
    expect(res[:body]).to eq(@sentiment_result)
  end
end
