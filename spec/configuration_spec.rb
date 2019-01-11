require "spec_helper"

RSpec.describe Satisfaction::Configuration do
  it "sets the default path" do
    config = Satisfaction::Configuration.new
    expect(config.sentiment_path.split("..").last).to eq("/config/")
  end

  it "respects a new path" do
    Satisfaction.configure do |config|
      config.sentiment_path = "/dev/null"
    end
    expect(Satisfaction.configuration.sentiment_path).to eq "/dev/null"
  end
end
