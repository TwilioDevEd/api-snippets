require_relative 'base_language_handler'

module LanguageHandler
  class RubyLanguageHandler < BaseLanguageHandler
    private

    def lang_cname
      'rb'
    end

    def execute(file)
      execute_with_suppressed_output("ruby #{file}")
    end
  end
end
