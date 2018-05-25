Rails.application.routes.draw do
  constraints Hangar::RouteConstraint.new do
    scope Hangar.route_namespace do
      FactoryBot.factories.map(&:name).map(&:to_s).map(&:pluralize).map(&:to_sym).each do |factory|
        resources factory, only: [:new, :create], controller: 'resources'
      end
      delete '/', to: 'records#delete'
    end
  end
end
