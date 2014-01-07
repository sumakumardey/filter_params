module FilterParams
	module Util
		def self.add_before_filter_hook(mapper_object)
			options = {}
			if mapper_object.filter_action_type != :all
			 options[mapper_object.filter_action_type] = mapper_object.filter_action
			end
			mapper_object.resource_name.camelize.constantize.send(:before_filter,options,mapper_object.proc)
		end
	end
end