Rails.application.routes.draw do
  constraints Hangar::RouteConstraint.new do
    FactoryGirl.factories.map(&:name).map(&:to_s).map(&:pluralize).map(&:to_sym).each do |factory|
      resources factory, only: [:new, :create], controller: 'hangar/resources'
    end
    delete '/', to: 'hangar/records#delete'
  end
end
