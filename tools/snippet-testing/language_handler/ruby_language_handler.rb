require_relative 'base_language_handler'

module LanguageHandler
  class RubyLanguageHandler < BaseLanguageHandler
    private

    def text_with_replacements(file_content)
      text_with_custom_api_client(text_with_credentials(file_content))
    end

    def text_with_custom_api_client(file_content)
      file_content.gsub(
        /Client\.new(\(|\s)(.+),\s?(.+)\)?$/,
        'Client.new(\2, \3, {ssl_verify_peer: false})'
      )
    end

    def lang_cname
      'rb'
    end

    def execute(file)
      execute_with_suppressed_output("ruby #{file}")
    end
  end
end
