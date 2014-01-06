require "action_controller"
require 'active_support/all'
require 'rr'


Spec::Runner.configure do |config|
  config.mock_with :rr
end

# sample rails app having only controller
RAILS_ROOT = File.dirname(__FILE__) + '/../lib/app'

#************************************
# loading the gem here and as well as the config
#************************************ 
require 'filter_params'
require RAILS_ROOT + '/config/filter_params.rb'

# *****************************************
# loading the dummy rails app
# *****************************************

Dir["#{RAILS_ROOT}/controllers/*.rb"].each {|file| require file }

