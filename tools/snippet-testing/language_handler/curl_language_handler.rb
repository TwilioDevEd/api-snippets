require 'open3'
require 'json'
require_relative 'base_language_handler'

module LanguageHandler
  class CurlLanguageHandler < BaseLanguageHandler
    private

    def execute(file)
      execute_with_suppressed_output("sh #{file}")
    end

    def lang_cname
      'curl'
    end

    def execute_with_suppressed_output(command)
      stdout, _, status = Open3.capture3(command)
      exit_code = status.exitstatus
      if exit_code == 0
        begin
          JSON.parse(stdout)
        rescue JSON::ParserError
          exit_code = 1
        end
      end
      success = exit_code == 0
      puts success ? "success [#{lang_cname}]".green : "failure [#{lang_cname}]".red
      success
    end

    def text_with_specific_replacements(file_content)
      text_without_bash_symbol(file_content)
    end

    def text_without_bash_symbol(file_content)
      file_content.gsub(/\A\$\s/, '')
    end
  end
end
