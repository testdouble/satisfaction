require "satisfaction/cli"
require "satisfaction/client"
require "satisfaction/configuration"
require "satisfaction/version"
require "satisfaction/transmit"
require "satisfaction/schema"
require "satisfaction/validator"
require "satisfaction/persist"
require "dotenv"

Dotenv.load

module Satisfaction
  class Error < StandardError; end
end
