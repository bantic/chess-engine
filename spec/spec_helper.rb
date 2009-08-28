require File.dirname(__FILE__) + '/../lib/chess'
require 'rubygems'
require 'spec'
require 'mocha'

include Chess

Spec::Runner.configure do |config|
  config.mock_with(:mocha)
end