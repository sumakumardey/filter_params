require "action_controller"
require 'active_support/all'
require 'mocha_standalone'
require 'mocha/object'

Spec::Runner.configure do |config|
	config.mock_with :mocha
end

