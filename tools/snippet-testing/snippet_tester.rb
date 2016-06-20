require 'json'
require 'colorize'
require_relative 'error_logger'
require_relative 'model/snippet_model'
require_relative 'model/test_session_model'
Dir["#{File.dirname(__FILE__)}/language_handler/*.rb"]
  .each { |file| require File.expand_path(file) }

class SnippetTester
  def initialize(parent_source_folder)
    @parent_source_folder = parent_source_folder.nil? ? Dir.pwd : parent_source_folder
    @running_folder = Dir.pwd
    Dir.chdir(@parent_source_folder)
    puts "Base folder is #{@parent_source_folder}"
    @snippets_models = []
    @test_models = [Model::TestSessionModel.new(@parent_source_folder)]
    @language_handlers = {
      'java'      => LanguageHandler::JavaLanguageHandler.new(@running_folder),
      'rb'        => LanguageHandler::RubyLanguageHandler.new(@running_folder),
      'js'        => LanguageHandler::NodeLanguageHandler.new(@running_folder),
      'php'       => LanguageHandler::PhpLanguageHandler.new(@running_folder),
      'py'        => LanguageHandler::PythonLanguageHandler.new(@running_folder),
      'curl'      => LanguageHandler::CurlLanguageHandler.new(@running_folder),
      'xml.curl'  => LanguageHandler::CurlXmlLanguageHandler.new(@running_folder),
      'json.curl' => LanguageHandler::CurlJsonLanguageHandler.new(@running_folder),
      'cs'        => LanguageHandler::CsharpLanguageHandler.new(
        @running_folder,
        [
          'Twilio.4.7.1/lib/3.5/Twilio.Api.dll',
          'Twilio.Pricing.1.1.0/lib/3.5/Twilio.Pricing.dll',
          'Twilio.IpMessaging.1.2.0/lib/3.5/Twilio.IpMessaging.dll',
          'Twilio.TaskRouter.2.3.0/lib/3.5/Twilio.TaskRouter.dll',
          'Twilio.Auth.1.2.0/lib/3.5/Twilio.Auth.dll',
          'JWT.1.1/lib/3.5/JWT.dll'
        ]
      )
    }
  end

  # Try to recon which snippets are going to be tested in a given folder
  def init
    puts '####### Recon snippets marked for testing #######'
    scan_folder_configs(@parent_source_folder)
  end

  def setup
    puts '####### Generating test-enviroment for marked snippets #######'
    @snippets_models.each do |snippet|
      print "Generated #{snippet.output_folder} -> ["
      snippet.available_langs.each do |lang, _file_name|
        print " #{lang}"
        @language_handlers.fetch(lang).replace_and_relocate(snippet, lang)
      end
      print " ]\n"
    end
  end

  def run
    puts '####### Testing marked snippets #######'
    @snippets_models.each do |snippet|
      puts "Testing #{snippet.output_folder}"
      snippet.available_langs.each do |lang, _file_name|
        @language_handlers.fetch(lang).test_snippet(snippet)
      end
    end
  end

  private

  attr_reader :parent_source_folder, :snippets_models, :test_models

  def current_config
    @test_models.last
  end

  def scan_folder_configs(folder_path)
    #import yaml config
    current_folder_has_config = import_existing_config(folder_path)
    #import snippet json
    import_existing_snippet(folder_path, current_config)
    Dir.glob(folder_path+"/*") do |folder|
      scan_folder_configs(folder) if File.directory?(folder)
    end
    erase_added_config if current_folder_has_config
  end

  def import_existing_config(folder_path)
    Dir.glob("#{folder_path}#{File::SEPARATOR}test.yaml") do |yaml_path|
      test_config = Model::TestSessionModel.new(yaml_path, current_config)
      test_models.push test_config
      puts test_config
      return true
    end
    return false
  end

  def erase_added_config
    test_models.pop
  end

  def import_existing_snippet(source_folder, test_model)
    Dir.glob("#{source_folder}#{File::SEPARATOR}meta.json") do |json_file|
      snippet_model = Model::SnippetModel.new(json_file.to_s, test_model)
      next unless snippet_model.testable?
      # Add this model to those to be tested
      puts snippet_model
      @snippets_models << snippet_model
    end
  end
end

def print_errors_if_any
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

if __FILE__ == $0
  begin
    tester = SnippetTester.new(ARGV[0])

    tester.init
    tester.setup
    tester.run

    print_errors_if_any
  rescue Interrupt
    print_errors_if_any
  end
end
