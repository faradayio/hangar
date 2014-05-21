require "hangar/engine"
require 'hangar/constraint'
require 'pry'

module Hangar
  BadEnvironmentError = Class.new(StandardError)

  def validate_environment
    Rails.env.test? or raise BadEnvironmentError, "Hangar should not be used in the #{Rails.env} environment"
  end
  module_function :validate_environment
end

