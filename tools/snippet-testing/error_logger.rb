require 'singleton'
require 'colorize'

class ErrorLogger
  include Singleton

  def initialize
    @errors = []
  end

  def add_error(file, message)
    errors.push(file: file, message: message)
  end

  def build_failed?
    !errors.empty?
  end

  def print_error_messages
    puts '#################################################################'.yellow
    puts "############# Error messages from failing snippets: #################\n".yellow
    errors.each do |error|
      puts error[:file].red
      puts error[:message]
      puts "-----------------------------------------------------------------\n"
    end
  end

  def print_errors
    puts "\n\n\n###############################################################\n"\
         "################### Error file summary: #######################\n".red
    errors.each { |error| puts error[:file].red }
  end

  attr_reader :errors
end
