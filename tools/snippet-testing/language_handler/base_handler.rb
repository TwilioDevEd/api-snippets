require 'fileutils'
require 'timeout'

module LanguageHandler
  class BaseHandler
    DEFAULT_PLACEHOLDER_REPLACEMENT = 'SIDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'.freeze
    LANG_CNAME = 'cname'.freeze
    PROCESS_TIMEOUT_EXIT_CODE = 120
    TEST_TIMEOUT = Integer(ENV['TEST_TIMEOUT'] || 20)
    UNHANDLED_LANGUAGE_MESSAGE = 'File name does not specify a Twilio library' \
                                 ' version. Rename snippet as ' \
                                 '\'snippet.rb\' => \'snippet.5.x.rb\'' \
                                 ' to use v5 of ruby\'s Twilio ' \
                                 'library for example'.freeze

    ROOT_FOLDER = "#{__dir__}/../../../".freeze

    attr_reader :dependencies_directory, :dependencies

    def initialize(dependencies_directory = Dir.pwd, dependencies = [])
      @dependencies_directory = dependencies_directory
      @dependencies = dependencies
    end

    def replace_and_relocate(snippet, lang)
      input_file = snippet.get_input_file(lang)
      output_file = snippet.get_output_file(lang)
      content = text_with_replacements(File.open(input_file).read)
      write_content(content, output_file)
    end

    def test_snippet(snippet_model)
      @input_file = snippet_model.get_input_file(lang_cname)
      @test_output = snippet_model.test_output
      path = snippet_model.get_output_file(lang_cname)
      execute(path)
    end

    def self.run_before_test(_directory); end

    private

    def execute(file)
      ErrorLogger.instance.add_error(
        file,
        UNHANDLED_LANGUAGE_MESSAGE,
        ErrorLogger::WARNING
      )
      puts "warning [#{lang_cname}]".yellow
    end

    def execute_command
      raise 'This method must me implemented in sub classes'
    end

    def excluded_twiml_nodes
      []
    end

    def execute_with_suppressed_output(command, file)
      rout, wout = IO.pipe
      rerr, werr = IO.pipe
      pid = Process.spawn(command, out: wout, err: werr)
      exit_code = check_process_success(pid, command)
      wout.close
      werr.close
      output = rout.read
      success = exit_code.zero? && assert_output(output) && language_conditional(output)

      if success
        puts "success [#{lang_cname}]".green
      else
        puts "failure [#{lang_cname}]".red
        error_message = rerr.read

        error_message += test_output_report(output) if @test_output

        ErrorLogger.instance.add_error(file, error_message, ErrorLogger::ERROR)
      end

      rout.close
      rerr.close
      success
    end

    def test_output_report(output)
      [
        '',
        'diff:'.red,
        "  sample: #{@current_sample}",
        "  output: #{output.chomp}"
      ].join("\n")
    end

    def assert_output(output)
      return true unless @test_output
      File.open(xml_output_file, 'r') do |xml|
        XmlMatcher.match(@current_sample = xml.read, output, excluded_twiml_nodes)
      end
    rescue => err
      puts err.message
    end

    def xml_output_file
      "#{File.dirname(@input_file)}/output/" \
      "#{File.basename(@input_file).split('.').first}.twiml"
    end

    def check_process_success(pid, command)
      Timeout.timeout(TEST_TIMEOUT) do
        _id, status = Process.wait2(pid)
        return status.exitstatus
      end
    rescue Timeout::Error
      puts 'process not finished in time, killing it'
      puts(command)
      Process.kill('KILL', pid)
      return PROCESS_TIMEOUT_EXIT_CODE
    end

    def language_conditional(_output)
      true
    end

    def output_folder
      Model::TestSession::OUTPUT_FOLDER
    end

    def text_with_replacements(file_content)
      text_with_specific_replacements(file_content)
    end

    def text_with_specific_replacements(file_content)
      file_content
    end

    def write_content(content, output_file)
      dir_name  = File.dirname(output_file)
      file_name = File.basename(output_file)
      FileUtils.mkdir_p(dir_name) unless Dir.exist?(dir_name)
      new_file = File.new(output_file, 'w+')
      new_file.write(content)
      new_file.close
    end

    def bash_string_command(command)
      "bash --login -c \"#{command}\""
    end

    def lang_cname
      self.class::LANG_CNAME
    end
  end
end
