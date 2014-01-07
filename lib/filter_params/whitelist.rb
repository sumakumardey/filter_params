require 'filter_params/sanitizer'
module FilterParams
	class Whitelist < FilterParams::Sanitizer
		def generate_proc(mapper_object)
		end
	end
end