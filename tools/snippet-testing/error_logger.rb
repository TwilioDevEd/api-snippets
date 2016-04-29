require 'singleton'

class ErrorLogger
  include Singleton

  def initialize
    @errors = []
  end

  def add_error(error)
    errors.push(error)
  end

  def build_failed?
    !errors.empty?
  end

  def print_errors
    errors.each { |error| puts error }
  end

  attr_reader :errors
end