module Hangar
  class ResourcesController < ActionController::Base
    respond_to :json

    def create
      created = FactoryGirl.create resource, resource_attributes
      respond_with created
    end

    def new
      attributes = FactoryGirl.attributes_for resource, resource_attributes
      respond_with attributes
    end

    private

    def resource
      request.path.split('/')[1].singularize.to_sym
    end

    def resource_attributes
      params.fetch(resource, {}).permit!
    end
  end
end