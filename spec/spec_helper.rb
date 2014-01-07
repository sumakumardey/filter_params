require "action_controller"
require 'active_support/all'
require 'rr'

Spec::Runner.configure do |config|
  config.mock_with :rr
end

#************************************
# loading the gem here and as well as the config
#************************************ 
require 'filter_params'
require File.dirname(__FILE__) + '/fixtures/application'
require File.dirname(__FILE__) + '/fixtures/controllers'
require File.dirname(__FILE__) + '/fixtures/filter_params'



# *****************************************
# loading the dummy rails app
# *****************************************

# Dir["#{RAILS_ROOT}/controllers/*.rb"].each {|file| require file }

