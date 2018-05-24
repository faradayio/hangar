Rails.application.routes.draw do
  constraints Hangar::RouteConstraint.new do
  scope module: 'hangar', path: 'factories', as: 'factory' do
    FactoryBot.factories.map(&:name).map(&:to_s).map(&:pluralize).map(&:to_sym).each do |factory|
      resources factory, only: [:new, :create], controller: 'hangar/resources'
    end
    delete '/', to: 'records#delete'
  end
end
