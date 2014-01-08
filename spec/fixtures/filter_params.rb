FilterParams::Cleaner::ParamsList.build do
	# default type is blacklist
	# usage resource :controller, :only =>[:action], :type => :blacklist, :fields => [{:user=>[{:hell=>[:one, :two]}]}]
	resource "posts_controller", :only =>[:action_one], :fields => [{:user => [:agent]}]
	resource "posts_controller", :only =>[:action_one], :fields => [{:user=>[{:hell=>[:one, :two]}, :four]},:three]
	resource "posts_controller", :only =>[:action_one], :type => :whitelist, :fields => [{:user=>[{:hell=>[:one, :two]}, :four]},:three]
end