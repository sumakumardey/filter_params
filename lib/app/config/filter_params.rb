FilterParams::Cleaner::ParamsList.build do
	# default type is blacklist
	# usage resource :controller, :only =>[:action], :type => "blacklist", :fields => [:user => [:id => []]]
	resource "test", :only =>[:action_one], :fields => [:user => [:agent]]
end