require 'filter_params/sanitizer'
module FilterParams
	class Whitelist < FilterParams::Sanitizer
		attr_accessor :final_method
		def generate_proc(mapper_object)
			self.final_method = ""
			mapper_object.fields << :controller
			mapper_object.fields << :action
			# p mapper_object.fields
			iterate_options(mapper_object.fields)
			# p self.final_method
			mapper_object.proc = Proc.new {|controller| 
				params = controller.params
				duplicate_params = {}
				eval(self.final_method)
				controller.params = HashWithIndifferentAccess.new(duplicate_params)
			}
		end

		# [{:user=>[{:hell=>[:one, :two]}, :four]},:three]    
		def iterate_options(options,previous_key="params",duplicate_params = "duplicate_params")
			options.each do |option|
				if option.is_a?(Hash)
					option.each do |key,value| 
						previous_key = "#{previous_key}"
						current_key = "#{previous_key}[\"#{key}\"]"
						self.final_method +=" if #{current_key} \n #{duplicate_params}[\"#{key}\"] = {} \n "
						duplicate_params =" #{duplicate_params}[\"#{key}\"]"
						if value.is_a?(Array)
							iterate_options(value,current_key,duplicate_params)
						end
						self.final_method +="end \n"
					end
				else
					self.final_method += " #{duplicate_params}[\"option\"] = #{previous_key}[\"#{option}\"] if #{previous_key} && #{previous_key}[\"#{option}\"] \n"
				end
			end
		end
	end
end