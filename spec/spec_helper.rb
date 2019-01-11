require "bundler/setup"
require "satisfaction"
require "dotenv"
require "vcr"

Dotenv.load

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/cassettes"
  config.hook_into :faraday
  config.default_cassette_options = {:serialize_with => :json, :record => :new_episodes}
  config.configure_rspec_metadata!
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
