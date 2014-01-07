require 'filter_params/sanitizer'
module FilterParams
	class Blacklist < FilterParams::Sanitizer		
		attr_accessor :final_method
		def generate_proc(mapper_object)
			self.final_method = ""
			iterator_options(mapper_object.fields)	
			mapper_object.proc = Proc.new {|controller| 
				params = controller.params
				eval(self.final_method)
			}
		end

		def iterator_options(options,previous_key="params")	
			options.each do |option|
				if option.is_a?(Hash)
					option.each do|key,value|
						previous_key = "#{previous_key}"
						current_key = "#{previous_key}[\"#{key}\"]"
						self.final_method +="if #{current_key} \n"
						if value.is_a?(Array)
							iterator_options(value,current_key)
						end
						self.final_method +="end \n"
					end
				else
					self.final_method += "#{previous_key}.delete(\"#{option}\") \n"
				end
			end
		end
	end
end