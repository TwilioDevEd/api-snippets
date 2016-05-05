require 'json'
require 'colorize'
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
  '.curl' => LanguageHandler::CurlLanguageHandler.new(OUTPUT_PATH),
  '.cs'   => LanguageHandler::CsharpLanguageHandler.new(OUTPUT_PATH)
}

LANGUAGE_EXECUTORS = {
  'java' => LanguageExecutor::JavaLanguageExecutor.new,
  'rb'   => LanguageExecutor::RubyLanguageExecutor.new,
  'js'   => LanguageExecutor::NodeLanguageExecutor.new,
  'php'  => LanguageExecutor::PhpLanguageExecutor.new,
  'py'   => LanguageExecutor::PythonLanguageExecutor.new,
  'curl' => LanguageExecutor::CurlLanguageExecutor.new,
  'cs'   => LanguageExecutor::CsharpLanguageExecutor.new(
    [
      'nuget/Twilio.4.7.1/lib/3.5/Twilio.Api.dll',
      'nuget/Twilio.Pricing.1.1.0/lib/3.5/Twilio.Pricing.dll',
      'nuget/Twilio.IpMessaging.1.2.0/lib/3.5/Twilio.IpMessaging.dll'
    ]
  )
}

puts '####### Snippets Marked For Testing #######'
Dir.glob("**/") do |directory|
  next if directory.include?('testing-tools') || !File.exist?("#{directory}meta.json")

  json_object = JSON.parse(File.read("#{directory}meta.json"))
  next unless json_object.fetch('test', 'false').downcase == 'true'
  puts "- #{directory}"

  Dir[directory + '*'].each do |file|
    path = File.expand_path(file)
    next if File.directory?(path)

    extension = File.extname(path)
    next unless LANGUAGE_HANDLERS.key?(extension)
    LANGUAGE_HANDLERS.fetch(extension).replace_and_relocate(file)
  end
end

Dir.glob(OUTPUT_PATH + '**/') do |directory|
  LANGUAGE_EXECUTORS.fetch('py').test_snippet(directory) if directory.include?('/py/')
  LANGUAGE_EXECUTORS.fetch('rb').test_snippet(directory) if directory.include?('/rb/')
  LANGUAGE_EXECUTORS.fetch('js').test_snippet(directory) if directory.include?('/js/')
  LANGUAGE_EXECUTORS.fetch('curl').test_snippet(directory) if directory.include?('/curl/')
  LANGUAGE_EXECUTORS.fetch('php').test_snippet(directory) if directory.include?('/php/')
  LANGUAGE_EXECUTORS.fetch('java').test_snippet(directory) if directory.include?('/java/')
  LANGUAGE_EXECUTORS.fetch('cs').test_snippet(directory) if directory.include?('/cs/')

end

if ErrorLogger.instance.build_failed?
  ErrorLogger.instance.print_errors
  exit(1)
end

puts "################################\n"\
     "#                              #\n"\
     "# Build Finished Successfully! #\n"\
     "#                              #\n"\
     "################################"

