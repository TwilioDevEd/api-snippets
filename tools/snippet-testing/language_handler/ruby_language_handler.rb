require_relative 'base_language_handler'

module LanguageHandler
  class RubyLanguageHandler < BaseLanguageHandler
    private

    def text_with_specific_replacements(file_content)
      text_with_custom_header(file_content)
    end

    def text_with_custom_header(file_content)
      file_content.prepend(
        "require 'openssl'\n"\
        "OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE\n"
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
