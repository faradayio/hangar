module Hangar
  class ResourcesController < ActionController::Base

    def create
      created = FactoryGirl.create resource, *traits, resource_attributes
      render json: created.as_json(include: includes)
    end

    def new
      attributes = FactoryGirl.attributes_for resource, *traits, resource_attributes
      render json: attributes
    end

    private

    def resource
      request.path.split('/')[1].singularize.to_sym
    end

    def resource_attributes
      params.fetch(resource, {}).permit!.to_h
    end

    def traits
      params.fetch(:traits, []).map &:to_sym
    end

    def includes
      params.fetch(:include, [])
    end
  end
end
