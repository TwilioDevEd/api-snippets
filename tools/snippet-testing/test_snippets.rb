require 'json'
require_relative 'error_logger'
Dir[File.dirname(__FILE__) + '/language_handler/*.rb'].each { |file| require File.expand_path(file) }
Dir[File.dirname(__FILE__) + '/language_executor/*.rb'].each { |file| require File.expand_path(file) }

OUTPUT_PATH = 'output/'

LANGUAGE_HANDLERS = {
  '.java' => LanguageHandler::JavaLanguageHandler.new(OUTPUT_PATH),
  '.rb'   => LanguageHandler::RubyLanguageHandler.new(OUTPUT_PATH),
  '.js'   => LanguageHandler::NodeLanguageHandler.new(OUTPUT_PATH),
  '.php'  => LanguageHandler::PhpLanguageHandler.new(OUTPUT_PATH),
  '.py'   => LanguageHandler::PythonLanguageHandler.new(OUTPUT_PATH),
  '.curl' => LanguageHandler::CurlLanguageHandler.new(OUTPUT_PATH)
}

LANGUAGE_EXECUTORS = {
  'java' => LanguageExecutor::JavaLanguageExecutor.new,
  'rb'   => LanguageExecutor::RubyLanguageExecutor.new,
  'js'   => LanguageExecutor::NodeLanguageExecutor.new,
  'php'  => LanguageExecutor::PhpLanguageExecutor.new,
  'py'   => LanguageExecutor::PythonLanguageExecutor.new,
  'curl' => LanguageExecutor::CurlLanguageExecutor.new
}

Dir.glob("**/") do |directory|
  next if directory.include?('testing-tools') || !File.exist?("#{directory}meta.json")

  json_object = JSON.parse(File.read("#{directory}meta.json"))
  next unless json_object.fetch('test', 'false').downcase == 'true'
  puts "------#{directory}-------"
  Dir[directory + '*'].each do |file|
    path = File.expand_path(file)
    next if File.directory?(path)

    extension = File.extname(path)
    next unless LANGUAGE_HANDLERS.key?(extension)
    LANGUAGE_HANDLERS.fetch(extension).replace_and_relocate(file)
  end
end

Dir.glob('output/**/') do |directory|
  LANGUAGE_EXECUTORS.fetch('py').test_snippet(directory) if directory.include?('py')
  LANGUAGE_EXECUTORS.fetch('rb').test_snippet(directory) if directory.include?('rb')
end

if ErrorLogger.instance.build_failed?
  puts "\n\n\n---------------------------------------------------------------"
  puts '-------------There were errors on these files:-----------------'
  ErrorLogger.instance.print_errors

  exit(1)
end

puts '################################'
puts '#                              #'
puts '# Build Finished Successfully! #'
puts '#                              #'
puts '################################'

