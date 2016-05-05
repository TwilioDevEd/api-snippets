require 'singleton'
require 'colorize'

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
    puts "\n\n\n###############################################################\n"\
         "#############There were errors on these files:#################\n".red
    errors.each { |error| puts error.red }
  end

  attr_reader :errors
end