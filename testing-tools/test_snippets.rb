require 'json'
Dir[File.dirname(__FILE__) + '/parser/*.rb'].each { |file| require File.expand_path(file) }

LANGUAGE_PARSERS = {
  '.java' => Parser::JavaParser.new,
  '.rb'   => Parser::RubyParser.new,
  '.js'   => Parser::NodeParser.new,
  '.php'  => Parser::PhpParser.new,
  '.py'   => Parser::PythonParser.new,
  '.curl' => Parser::CurlParser.new
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
    next unless LANGUAGE_PARSERS.key?(extension)
    LANGUAGE_PARSERS.fetch(extension).parse_file(file)
  end
end