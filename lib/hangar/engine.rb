module Hangar
  class Engine < ::Rails::Engine
    initializer :promote_hangar_routes, after: :add_routing_paths do |app|
      hangar_routes_path = File.expand_path('../../../config/routes.rb', __FILE__)
      app.routes_reloader.paths.delete hangar_routes_path
      app.routes_reloader.paths.unshift hangar_routes_path
    end
  end
end
