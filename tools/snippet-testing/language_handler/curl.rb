require 'open3'
require 'json'
require_relative 'base_handler'

module LanguageHandler
  class Curl < BaseHandler
    LANG_CNAME = 'curl'.freeze

    private

    def execute_command(file)
      execute_with_suppressed_output("sh #{file}", file)
    end

    def language_conditional(rout)
      responses = splitted_responses(rout.read)
      return false if responses.empty?

      responses.each do |response|
        begin
          JSON.parse(response)
        rescue JSON::ParserError
          return false
        end
      end
    end

    def splitted_responses(output)
      responses = output.split('}{')
      return responses if responses.count == 1 || responses.empty?

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
