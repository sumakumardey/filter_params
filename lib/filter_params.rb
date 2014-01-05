require "filter_params/version"
require "filter_params/whitelist"
require "filter_params/blacklist"

module FilterParams
  def self.included(base)
  	base.extend(ClassMethods)
  end

  module ClassMethods
  	def clean_params_whitelist(options={})
  	end

  	def clean_params_blacklist(options={})
  	end
  end
end

class ApplicationController
	include FilterParams
end
