require "spec_helper"

RSpec.describe Satisfaction::Schema do
  it "can load schema definitions" do
    subject = Satisfaction::Schema.new
    expect(subject.schemas.length).to eq(1)
  end
end
