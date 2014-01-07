require 'filter_params/util'

module FilterParams
	class Sanitizer 
		def self.generate_method_and_add_hook(mapper_object)
			mapper_object.proc = self.generate_proc(mapper_object)
			FilterParams::Util.add_before_filter_hook(mapper_object)
		end

		def self.generate_proc(mapper_object)
		end
	end
end