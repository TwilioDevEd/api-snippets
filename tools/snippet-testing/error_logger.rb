require 'singleton'
require 'colorize'

class ErrorLogger
  include Singleton

  ERROR   = 0
  WARNING = 1

  def initialize
    @errors = []
  end

  def add_error(file, message, type)
    errors.push(file: file, message: message, type: type)
  end

  def build_failed?
    !errors.empty?
  end

  def print_error_messages
    puts '#################################################################'.light_blue
    puts "############# Error messages from failing snippets: #################\n".light_blue
    errors.each do |error|
      puts error[:file].red if error[:type] == ERROR
      puts error[:file].yellow if error[:type] == WARNING
      puts error[:message]
      puts "-----------------------------------------------------------------\n"
    end
  end

  def print_errors
    puts "\n\n\n###############################################################\n"\
         "################### Error file summary: #######################\n".red
    errors.each do |error|
      puts error[:file].red if error[:type] == ERROR
      puts error[:file].yellow if error[:type] == WARNING
    end
  end

  attr_reader :errors
end
