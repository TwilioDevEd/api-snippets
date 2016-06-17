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
        splitted_responses(stdout).each do |response|
          begin
            JSON.parse(response)
          rescue JSON::ParserError
            exit_code = 1
            break
          end
        end
      end
      success = exit_code == 0
      puts success ? "success [#{lang_cname}]".green : "failure [#{lang_cname}]".red
      success
    end

    def splitted_responses(output)
      responses = output.split('}{')
      return responses if responses.count == 1

      first_response = [responses.first + '}']
      last_response = ['{' + responses.last]
      middle_responses = responses[1..-2].map { |response| "{#{response}}" }

      first_response + middle_responses + last_response
    end

    def text_with_specific_replacements(file_content)
      text_without_gt_lt_symbols(text_without_bash_symbol(file_content))
    end

    def text_without_gt_lt_symbols(file_content)
      file_content.gsub(/[<>]{1}/, '')
    end

    def text_without_bash_symbol(file_content)
      file_content.gsub(/^\$\s/, '')
    end
  end
end
