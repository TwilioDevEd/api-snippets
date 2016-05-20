require_relative 'base_language_handler'

module LanguageHandler
  class CurlLanguageHandler < BaseLanguageHandler
    def lang_cname
      'curl'
    end

    def execute(file)
      execute_with_suppressed_output("sh #{file}")
    end

    private

    def text_with_replacements(file_content)
      text_without_bash_symbol(text_with_credentials(file_content))
    end

    def text_without_bash_symbol(file_content)
      file_content.gsub(/\A\$\s/, '')
    end
  end
end