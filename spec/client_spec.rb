require "spec_helper"

RSpec.describe Satisfaction::Client do
  let(:git) { Git.open(".") }

  subject {Satisfaction::Client.new(git)}

  it "accepts a client" do
    expect(subject.client).to eq(git)
  end

  it "can show all of the commit messages in history" do

  end

end
