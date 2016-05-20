require_relative 'base_language_handler'

module LanguageHandler
  class RubyLanguageHandler < BaseLanguageHandler
    def lang_cname
      'rb'
    end

    private

    def execute(file)
      execute_with_suppressed_output("ruby #{file}")
    end
  end
end