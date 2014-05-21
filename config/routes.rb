Rails.application.routes.draw do
  FactoryGirl.factories.map(&:name).map(&:to_sym).each do |factory|
    resources factory, only: [:new, :create], controller: 'hangar/resources'
  end
end
