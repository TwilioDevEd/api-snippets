require 'json'
Dir[File.dirname(__FILE__) + '/language_handler/*.rb'].each { |file| require File.expand_path(file) }
Dir[File.dirname(__FILE__) + '/language_executor/*.rb'].each { |file| require File.expand_path(file) }

LANGUAGE_HANDLERS = {
  '.java' => LanguageHandler::JavaLanguageHandler.new,
  '.rb'   => LanguageHandler::RubyLanguageHandler.new,
  '.js'   => LanguageHandler::NodeLanguageHandler.new,
  '.php'  => LanguageHandler::PhpLanguageHandler.new,
  '.py'   => LanguageHandler::PythonLanguageHandler.new,
  '.curl' => LanguageHandler::CurlLanguageHandler.new
}

LANGUAGE_EXECUTORS = {
  '.java' => LanguageExecutor::JavaLanguageExecutor.new,
  '.rb'   => LanguageExecutor::RubyLanguageExecutor.new,
  '.js'   => LanguageExecutor::NodeLanguageExecutor.new,
  '.php'  => LanguageExecutor::PhpLanguageExecutor.new,
  '.py'   => LanguageExecutor::PythonLanguageExecutor.new,
  '.curl' => LanguageExecutor::CurlLanguageExecutor.new
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
    LANGUAGE_HANDLERS.fetch(extension).parse_file(file)
  end
end