require "hangar/engine"
require 'hangar/constraint'
require 'database_cleaner'

module Hangar
  BadEnvironmentError = Class.new(StandardError)

  mattr_writer :do_not_delete

  def self.do_not_delete
    Array.wrap(@@do_not_delete)
  end

  def validate_environment
    Rails.env.test? or raise BadEnvironmentError, "Hangar should not be used in the #{Rails.env} environment"
  end
  module_function :validate_environment
end

