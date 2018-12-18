module Hangar
  class ResourcesController < ActionController::Base
    def create
      created = FactoryBot.create resource, *traits, resource_attributes
      render json: created.as_json(include: includes)
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
      @includes ||= begin
        _includes = params.fetch(:include, {}).as_json

        unless _includes.is_a?(Hash)
          array_of_assocation_and_options_pairs = Array(_includes).flat_map do |n|
            n.is_a?(Hash) ? n.to_a : [[n, {}]]
          end

          _includes = Hash[array_of_assocation_and_options_pairs]
        end

        _includes.deep_symbolize_keys
      end
    end
  end
end
