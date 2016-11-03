require 'fileutils'
require 'timeout'

module LanguageHandler
  class BaseHandler
    DEFAULT_PLACEHOLDER_REPLACEMENT = 'SIDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'.freeze
    LANG_CNAME = 'cname'.freeze
    PROCESS_TIMEOUT_EXIT_CODE = 120
    UNHANDLED_LANGUAGE_MESSAGE = 'File name does not specify a Twilio library' \
                                 ' version. Rename snippet as ' \
                                 '\'snippet.rb\' => \'snippet.5.x.rb\'' \
                                 ' to use v5 of ruby\'s Twilio ' \
                                 'library for example'.freeze

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
      path = snippet_model.get_output_file(lang_cname)
      execute(path)
    end

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

    def execute_with_suppressed_output(command, file)
      rout, wout = IO.pipe
      rerr, werr = IO.pipe
      pid = Process.spawn(command, out: wout, err: werr)
      exit_code = check_process_success(pid)
      wout.close
      werr.close
      success = exit_code.zero? && language_conditional(rout)

      if success
        puts "success [#{lang_cname}]".green
      else
        puts "failure [#{lang_cname}]".red
        error_message = rerr.read
        ErrorLogger.instance.add_error(file, error_message, ErrorLogger::ERROR)
      end
      rout.close
      rerr.close
      success
    end

    def check_process_success(pid)
      Timeout.timeout(20) do
        _id, status = Process.wait2(pid)
        return status.exitstatus
      end
    rescue Timeout::Error
      puts 'process not finished in time, killing it'
      Process.kill('KILL', pid)
      return PROCESS_TIMEOUT_EXIT_CODE
    end

    def language_conditional(_rout)
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
      "bash -c '#{command}'"
    end

    def lang_cname
      self.class::LANG_CNAME
    end
  end
end
