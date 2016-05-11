require 'json'
require 'colorize'
require_relative 'error_logger'
require_relative 'dm/snippet_dm'
require_relative 'dm/test_session_dm'
Dir[File.dirname(__FILE__) + '/language_handler/*.rb'].each { |file| require File.expand_path(file) }
Dir[File.dirname(__FILE__) + '/language_executor/*.rb'].each { |file| require File.expand_path(file) }

class SnippetTester

  OUTPUT_PATH = 'output/'

  LANGUAGE_HANDLERS = {
      '.java' => LanguageHandler::JavaLanguageHandler.new(OUTPUT_PATH),
      '.rb' => LanguageHandler::RubyLanguageHandler.new(OUTPUT_PATH),
      '.js' => LanguageHandler::NodeLanguageHandler.new(OUTPUT_PATH),
      '.php' => LanguageHandler::PhpLanguageHandler.new(OUTPUT_PATH),
      '.py' => LanguageHandler::PythonLanguageHandler.new(OUTPUT_PATH),
      '.curl' => LanguageHandler::CurlLanguageHandler.new(OUTPUT_PATH),
      '.cs' => LanguageHandler::CsharpLanguageHandler.new(OUTPUT_PATH)
  }

  LANGUAGE_EXECUTORS = {
      'java' => LanguageExecutor::JavaLanguageExecutor.new,
      'rb' => LanguageExecutor::RubyLanguageExecutor.new,
      'js' => LanguageExecutor::NodeLanguageExecutor.new,
      'php' => LanguageExecutor::PhpLanguageExecutor.new,
      'py' => LanguageExecutor::PythonLanguageExecutor.new,
      'curl' => LanguageExecutor::CurlLanguageExecutor.new,
      'cs' => LanguageExecutor::CsharpLanguageExecutor.new(
          [
              'nuget/Twilio.4.7.1/lib/3.5/Twilio.Api.dll',
              'nuget/Twilio.Pricing.1.1.0/lib/3.5/Twilio.Pricing.dll',
              'nuget/Twilio.IpMessaging.1.2.0/lib/3.5/Twilio.IpMessaging.dll'
          ]
      )
  }

  attr_reader :parentFolder, :snippets_models, :test_models

  def initialize(parentFolder)
    @parentFolder = parentFolder
    @snippets_models = []
    @test_models = []
  end

  #Try to recon which snippets are going to be tested in some given folder
  def init
    puts '####### Recon Snippets Marked For Testing #######'
    Dir.glob("**/") do |directory|
      next !File.exist?("#{directory}meta.json")
      snippetModel = SnippetModel.new("#{directory}meta.json")
      next unless snippetModel.testeable?
      #Add this model to those to be tested
      @snippets_models.put(snippetModel)
      puts snippetModel
    end
  end

  def setup
    @snippets_models.each do |snippet|
      snippet.availableLangs.each do |lang|
        LANGUAGE_HANDLERS.fetch(lang).replace_and_relocate(file)
      end
    end
  end

  def run
    Dir.glob(OUTPUT_PATH + '**/') do |directory|
      LANGUAGE_EXECUTORS.fetch('py').test_snippet(directory) if directory.include?('/py/')
      LANGUAGE_EXECUTORS.fetch('rb').test_snippet(directory) if directory.include?('/rb/')
      LANGUAGE_EXECUTORS.fetch('js').test_snippet(directory) if directory.include?('/js/')
      LANGUAGE_EXECUTORS.fetch('curl').test_snippet(directory) if directory.include?('/curl/')
      LANGUAGE_EXECUTORS.fetch('php').test_snippet(directory) if directory.include?('/php/')
      LANGUAGE_EXECUTORS.fetch('java').test_snippet(directory) if directory.include?('/java/')
      LANGUAGE_EXECUTORS.fetch('cs').test_snippet(directory) if directory.include?('/cs/')
    end
  end

  def execute

  end
end

if __FILE__ == $0

  tester = SnippetTester.new($1)

  tester.init
  tester.setup

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

