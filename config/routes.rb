Rails.application.routes.draw do
  constraints Hangar::RouteConstraint.new do
    FactoryGirl.factories.map(&:name).map(&:to_s).map(&:pluralize).map(&:to_sym).each do |factory|
      namespace :hangar do
        resources factory, only: [:new, :create], controller: 'resources'
      end
    end
    namespace :hangar do
      delete '/', to: 'records#delete'
    end
  end
end
