module Hangar
  class ResourcesController < ActionController::Base

    rescue_from StandardError, :with => :error_render_method

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

    def error_render_method(exception)
      status_code = ActionDispatch::ExceptionWrapper.new(env, exception).status_code
      respond_to do |type|
        type.json { render :json => {error: exception.message}.to_json, :status => status_code}
        type.all { throw exception }
      end
      true
    end
  end
end
