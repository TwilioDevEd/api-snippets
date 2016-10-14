require 'json'
require 'optparse'
require 'ostruct'
require 'colorize'
require_relative 'error_logger'
require_relative 'model/snippet'
require_relative 'model/test_session'
require_relative 'model/dependency'
Dir["#{File.dirname(__FILE__)}/language_handler/*.rb"].each { |file| require File.expand_path(file) }

class SnippetTester
  def install_dependencies
    puts 'Installing Dependencies, please wait'
    Model::Dependency.install_dependencies
    puts 'Dependencies installed!'
  end

  def initialize(parent_source_folder, test_default = false)
    @parent_source_folder = parent_source_folder
    Dir.chdir(@parent_source_folder)
    puts "Base folder is #{@parent_source_folder}"
    @snippet_models = []
    @test_models = [
      Model::TestSession.new(@parent_source_folder, nil, test_default)
    ]
    @language_handlers = get_language_handlers
  end

  # Try to recon which snippets are going to be tested in a given folder
  def init
    puts '####### Recon snippets marked for testing #######'
    scan_folder_configs(@parent_source_folder)
  end

  def setup
    puts '####### Generating test-enviroment for marked snippets #######'
    @snippet_models.each do |snippet|
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
    @snippet_models.each do |snippet|
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
    # import yaml config
    current_folder_has_config = import_existing_config(folder_path)
    # import snippet json
    import_existing_snippet(folder_path, current_config)
    Dir.glob(folder_path+"/*") do |folder|
      scan_folder_configs(folder) if File.directory?(folder)
    end
    erase_added_config if current_folder_has_config
  end

  def import_existing_config(folder_path)
    Dir.glob("#{folder_path}#{File::SEPARATOR}test.yml") do |yaml_path|
      test_config = Model::TestSession.new(yaml_path, current_config)
      test_models.push test_config
      puts test_config
      return true
    end
    return false
  end

  def erase_added_config
    test_models.pop
  end

  def get_language_handlers
    php4_language_handler = LanguageHandler::Php4.new(
      Model::Dependency.php_4_path
    )
    php5_language_handler = LanguageHandler::Php5.new(
      Model::Dependency.php_5_path
    )

    csharp4_language_handler = LanguageHandler::Csharp4.new(
      Model::Dependency.csharp_4_path,
      Model::Dependency.csharp_4_dependencies
    )

    csharp5_language_handler = LanguageHandler::Csharp5.new(
      Model::Dependency.csharp_5_path,
      Model::Dependency.csharp_5_dependencies
    )

    python5_language_handler = LanguageHandler::Python5.new(
      Model::Dependency.python_5_venv
    )

    python6_language_handler = LanguageHandler::Python6.new(
      Model::Dependency.python_6_venv
    )

    ruby4_language_handler = LanguageHandler::Ruby4.new(
      Model::Dependency.ruby_4_gemset
    )

    ruby5_language_handler = LanguageHandler::Ruby5.new(
      Model::Dependency.ruby_5_gemset
    )

    node2_language_handler = LanguageHandler::Node2.new(
      Model::Dependency.node_2_path
    )

    node3_language_handler = LanguageHandler::Node3.new(
      Model::Dependency.node_3_path
    )

    {
      LanguageHandler::Java::LANG_CNAME     => LanguageHandler::Java.new,
      LanguageHandler::Java6::LANG_CNAME    => LanguageHandler::Java6.new,
      LanguageHandler::Java7::LANG_CNAME    => LanguageHandler::Java7.new,
      LanguageHandler::Ruby::LANG_CNAME     => LanguageHandler::Ruby.new,
      LanguageHandler::Ruby4::LANG_CNAME    => ruby4_language_handler,
      LanguageHandler::Ruby5::LANG_CNAME    => ruby5_language_handler,
      LanguageHandler::Node::LANG_CNAME     => LanguageHandler::Node.new,
      LanguageHandler::Node2::LANG_CNAME    => node2_language_handler,
      LanguageHandler::Node3::LANG_CNAME    => node3_language_handler,
      LanguageHandler::Php::LANG_CNAME      => LanguageHandler::Php.new,
      LanguageHandler::Php4::LANG_CNAME     => php4_language_handler,
      LanguageHandler::Php5::LANG_CNAME     => php5_language_handler,
      LanguageHandler::Python::LANG_CNAME   => LanguageHandler::Python.new,
      LanguageHandler::Python5::LANG_CNAME  => python5_language_handler,
      LanguageHandler::Python6::LANG_CNAME  => python6_language_handler,
      LanguageHandler::Curl::LANG_CNAME     => LanguageHandler::Curl.new,
      LanguageHandler::CurlXml::LANG_CNAME  => LanguageHandler::CurlXml.new,
      LanguageHandler::CurlJson::LANG_CNAME => LanguageHandler::CurlJson.new,
      LanguageHandler::Csharp::LANG_CNAME   => LanguageHandler::Csharp.new,
      LanguageHandler::Csharp4::LANG_CNAME  => csharp4_language_handler,
      LanguageHandler::Csharp5::LANG_CNAME  => csharp5_language_handler
    }
  end

  def import_existing_snippet(source_folder, test_model)
    Dir.glob("#{source_folder}#{File::SEPARATOR}meta.json") do |json_file|
      snippet_model = Model::Snippet.new(json_file.to_s, test_model)
      next unless snippet_model.testable?
      # Add this model to those to be tested
      puts snippet_model
      @snippet_models << snippet_model
    end
  end
end

def print_errors_if_any
  if ErrorLogger.instance.build_failed?
    ErrorLogger.instance.print_error_messages
    ErrorLogger.instance.print_errors
    exit(1)
  end

  puts "################################\n"\
     "#                              #\n"\
     "# Build Finished Successfully! #\n"\
     "#                              #\n"\
     "################################"
end

def parse_options(args)
  options = OpenStruct.new
  options.source_folder = Dir.pwd
  options.install = false
  options.test_default = nil

  opts = OptionParser.new do |opts|
    opts.banner = 'Usage: ruby snippet_tester.rb [options]'

    opts.separator ''
    opts.separator 'Specific options:'

    opts.on('-i', '--[no-]install', 'Install dependencies before running tests') do |install|
      options.install = install
    end

    opts.on('-t', '--[no-]test', 'Test: true as default behavior for directories') do |test_default|
      options.test_default = test_default
    end

    opts.on('-d directory', String, 'Specify a directory to be tested') do |dir|
      options.source_folder = File.expand_path(dir)
      options.test_default = true if options.test_default.nil?
    end
  end

  opts.parse!(args)
  options
end

if __FILE__ == $0
  begin
    options = parse_options(ARGV)
    tester = SnippetTester.new(options.source_folder, options.test_default)

    tester.install_dependencies if options.install
    tester.init
    tester.setup
    tester.run

    print_errors_if_any
  rescue Interrupt
    print_errors_if_any
  end
end
