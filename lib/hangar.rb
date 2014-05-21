require "hangar/engine"
require 'hangar/constraint'

module Hangar
  BadEnvironmentError = Class.new(StandardError)
end

unless Rails.env.test?
  raise Hangar::BadEnvironmentError
end