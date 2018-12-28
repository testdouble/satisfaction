require "spec_helper"

RSpec.describe Satisfaction::Client do
  let(:git) { Git.open(".") }
  subject { Satisfaction::Client.new }

  it "can access the git log" do
    log = subject.log.first
    expect(log[:sha]).to eq(git.log.first.sha)
    expect(log[:message]).to eq(git.log.first.message)
  end

  it "can access the most recent commit" do
    expect(subject.head[:sha]).to eq(git.object("HEAD").sha)
    expect(subject.head[:message]).to eq(git.object("HEAD").message)
  end

  it "transmits sentiments", :vcr do
    result = subject.sentiments
    expect(result.length).to eq(15)
    result.each do |r|
      expect(r[:score][:status_code]).to eq(200)
      expect(r[:score]).to have_key(:body)
    end
  end

  it "stores sentiment results" do
  end
end
