module Hangar
  class ResourcesController < ActionController::Base
    respond_to :json

    def create
      created = FactoryGirl.create resource
      respond_with created
    end

    def new
      attributes = FactoryGirl.attributes_for resource
      respond_with attributes
    end

    private

    def resource
      request.path.split('/')[1].singularize.to_sym
    end
  end
end