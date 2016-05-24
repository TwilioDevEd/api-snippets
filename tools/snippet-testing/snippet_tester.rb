require 'json'
require 'colorize'
require_relative 'error_logger'
require_relative 'model/snippet_model'
require_relative 'model/test_session_model'
Dir["#{File.dirname(__FILE__)}/language_handler/*.rb"]
  .each { |file| require File.expand_path(file) }

class SnippetTester
  OUTPUT_PATH = 'output'.freeze

  LANGUAGE_HANDLERS = {
    'java'      => LanguageHandler::JavaLanguageHandler.new(OUTPUT_PATH),
    'rb'        => LanguageHandler::RubyLanguageHandler.new(OUTPUT_PATH),
    'js'        => LanguageHandler::NodeLanguageHandler.new(OUTPUT_PATH),
    'php'       => LanguageHandler::PhpLanguageHandler.new(OUTPUT_PATH),
    'py'        => LanguageHandler::PythonLanguageHandler.new(OUTPUT_PATH),
    'curl'      => LanguageHandler::CurlLanguageHandler.new(OUTPUT_PATH),
    'xml.curl'  => LanguageHandler::CurlXmlLanguageHandler.new(OUTPUT_PATH),
    'json.curl' => LanguageHandler::CurlJsonLanguageHandler.new(OUTPUT_PATH),
    'cs'        => LanguageHandler::CsharpLanguageHandler.new(
      OUTPUT_PATH,
      [
        'nuget/Twilio.4.7.1/lib/3.5/Twilio.Api.dll',
        'nuget/Twilio.Pricing.1.1.0/lib/3.5/Twilio.Pricing.dll',
        'nuget/Twilio.IpMessaging.1.2.0/lib/3.5/Twilio.IpMessaging.dll'
      ]
    )
  }.freeze

  def initialize(parent_folder)
    @parent_folder = parent_folder.nil? ? Dir.pwd : parent_folder
    Dir.chdir(@parent_folder)
    puts "Base folder is #{@parent_folder}"
    @snippets_models = []
    @test_models = []
  end

  # Try to recon which snippets are going to be tested in a given folder
  def init
    puts '####### Recon snippets marked for testing #######'
    Dir.glob("#{parent_folder}/**/meta.json") do |json_file|
      snippet_model = Model::SnippetModel.new(json_file.to_s, OUTPUT_PATH)
      next unless snippet_model.testable?
      # Add this model to those to be tested
      puts snippet_model
      @snippets_models << snippet_model
    end
  end

  def setup
    puts '####### Generating test-enviroment for marked snippets #######'
    @snippets_models.each do |snippet|
      print "Generated #{snippet.folder_path} -> ["
      snippet.available_langs.each do |lang|
        print " #{lang}"
        file = snippet.get_filepath(lang)
        LANGUAGE_HANDLERS.fetch(lang).replace_and_relocate(file)
      end
      print " ]\n"
    end
  end

  def run
    puts '####### Testing marked snippets #######'
    @snippets_models.each do |snippet|
      puts "Testing #{snippet.folder_path}"
      snippet.available_langs.each do |lang|
        LANGUAGE_HANDLERS.fetch(lang).test_snippet(snippet)
      end
    end
  end

  private

  attr_reader :parent_folder, :snippets_models, :test_models
end

if __FILE__ == $0
  tester = SnippetTester.new(ARGV[0])

  tester.init
  tester.setup
  tester.run

  if ErrorLogger.instance.build_failed?
    ErrorLogger.instance.print_errors
    exit(1)
  end

  puts "################################\n"\
     "#                              #\n"\
     "# Build Finished Successfully! #\n"\
     "#                              #\n"\
     "################################"
end
