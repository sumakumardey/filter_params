FilterParams::Cleaner::ParamsList.build do
	# default type is blacklist
	# usage resource :controller, :only =>[:action], :type => :blacklist, :fields => [:user => [:id => []]]
	resource "posts_controller", :only =>[:action_one], :fields => [:user => [:agent]]
end