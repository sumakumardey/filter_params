module FilterParams
  class Mapper

 		ValidType = [:blacklist,:whitelist]
  	attr_accessor :proc, :filter_action, :filter_action_type, :resource_name, :type
  	
  	def initialize
  		@filter_action = []
  		@prefix = "filter_params"
  	end

  	def build(&block)
  		instance_exec(&block)
  	end

  	def resource(resource_name, *args)
  		@resource_name = resource_name
  		options = args.extract_options!
  		@type = options[:type] ? options[:type] : :blacklist
  		# @method_name = generate_method_name
  		if(options && options[:only])
  			@filter_action = options[:only]
  			@filter_action_type = :only
  		elsif(options && options[:except])
  			@filter_action = options[:except]
  			@filter_action_type = :except
  		else
  			@filter_action_type = :all
  		end
  		if @type == :blacklist
  			FilterParams::Blacklist.generate_method_and_add_hook(self)
  		elsif @type == :whitelist
  			FilterParams::Whitelist.generate_method_and_add_hook(self)
  		else
  			raise "Invalid type in resource it should be either :blacklist or :whitelist"
  		end
  	end

  	# def generate_method_name
  	# 	[@prefix,@resource,@filter_action[0]].join("_").gsub("/","_")
  	# end
  end
end
