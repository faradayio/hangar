require "hangar/engine"
require 'hangar/constraint'
require 'database_cleaner'

module Hangar
  BadEnvironmentError = Class.new(StandardError)

  mattr_writer :do_not_delete, :route_namespace
  mattr_accessor :clean_strategy, :created_data

  self.clean_strategy = :deletion
  self.route_namespace = nil
  self.created_data = Hash.new

  def self.do_not_delete
    Array.wrap(@@do_not_delete)
  end

  def self.route_namespace
    if(@@route_namespace.present?)
      {
        module: 'hangar',
        path: @@route_namespace.to_s.pluralize,
        as: @@route_namespace.to_s.singularize
      }
      else
      { module: 'hangar' }
    end
  end

  def validate_environment
    Rails.env.test? || Rails.env.development? or raise BadEnvironmentError, "Hangar should not be used in the #{Rails.env} environment"
  end
  module_function :validate_environment
end

