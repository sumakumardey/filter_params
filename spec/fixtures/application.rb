  require 'active_support/all'
  require 'action_controller'

  module Rails
    class App
      def env_config; {} end
      def routes
        return @routes if defined?(@routes)
        @routes = ActionController::Routing::Routes
        @routes.draw do |map|
          map.resources :posts # Replace with your own needs
        end
        @routes
      end
    end

    def self.application
      @app ||= App.new
    end
  end