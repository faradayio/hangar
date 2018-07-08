module Hangar
  class ResourcesController < ActionController::Base

    def create
      created = FactoryBot.create resource, *traits, resource_attributes
      render json: created.as_json(include: includes.as_json)
    end

    def new
      attributes = FactoryBot.attributes_for resource, *traits, resource_attributes
      render json: attributes
    end

    private

    def resource
      index = Hangar.route_namespace[:path].present? ? 2 : 1
      request.path.split('/')[index].singularize.to_sym
    end

    def resource_attributes
      params.fetch(resource, {}).permit!.to_h
    end

    def traits
      @traits ||= params[:traits].blank? ? [] : params.require(:traits).map(&:to_sym)
    end

    def includes
      @includes ||= params[:include].blank? ? [] : params.require(:include)
    end
  end
end
