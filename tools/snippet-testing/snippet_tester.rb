require 'json'
require 'colorize'
require_relative 'error_logger'
require_relative 'dm/snippet_dm'
require_relative 'dm/test_session_dm'
Dir[File.dirname(__FILE__) + '/language_handler/*.rb'].each { |file| require File.expand_path(file) }

class SnippetTester

  OUTPUT_PATH = 'output'

  LANGUAGE_HANDLERS = {
      'java' => LanguageHandler::JavaLanguageHandler.new(OUTPUT_PATH),
      'rb' => LanguageHandler::RubyLanguageHandler.new(OUTPUT_PATH),
      'js' => LanguageHandler::NodeLanguageHandler.new(OUTPUT_PATH),
      'php' => LanguageHandler::PhpLanguageHandler.new(OUTPUT_PATH),
      'py' => LanguageHandler::PythonLanguageHandler.new(OUTPUT_PATH),
      'curl' => LanguageHandler::CurlLanguageHandler.new(OUTPUT_PATH),
      'xml.curl' => LanguageHandler::CurlXmlLanguageHandler.new(OUTPUT_PATH),
      'json.curl' => LanguageHandler::CurlJsonLanguageHandler.new(OUTPUT_PATH),
      'cs' => LanguageHandler::CsharpLanguageHandler.new(OUTPUT_PATH,
          [
              'nuget/Twilio.4.7.1/lib/3.5/Twilio.Api.dll',
              'nuget/Twilio.Pricing.1.1.0/lib/3.5/Twilio.Pricing.dll',
              'nuget/Twilio.IpMessaging.1.2.0/lib/3.5/Twilio.IpMessaging.dll'
          ]
       )
  }

  attr_reader :parentFolder, :snippets_models, :test_models

  def initialize(parentFolder)
    @parentFolder = parentFolder.nil? ?  "/" : parentFolder
    puts "La carpeta base es #{@parentFolder}"
    @snippets_models = []
    @test_models = []
  end

  #Try to recon which snippets are going to be tested in some given folder
  def init
    puts '####### Recon snippets marked for testing #######'
    Dir.glob("#{parentFolder}/**/meta.json") do |jsonFile|
      snippetModel = SnippetModel.new("#{jsonFile}", OUTPUT_PATH)
      next unless snippetModel.testable?
      #Add this model to those to be tested
      puts snippetModel
      @snippets_models << snippetModel
    end
  end

  def setup
    puts '####### Generating test-enviroment for marked snippets #######'
    @snippets_models.each do |snippet|
      snippet.availableLangs.each do |lang|
        file = snippet.get_filepath lang
        LANGUAGE_HANDLERS.fetch(lang).replace_and_relocate(file)
      end
    end
  end

  def run
    puts '####### Testing marked snippets #######'
    @snippets_models.each do |snippet|
      puts "Testing #{snippet.folderPath}"
      snippet.availableLangs.each do |lang|
        LANGUAGE_HANDLERS.fetch(lang).test_snippet(snippet)
      end
    end
  end

  def execute

  end
end

if __FILE__ == $0

  tester = SnippetTester.new($1)

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

