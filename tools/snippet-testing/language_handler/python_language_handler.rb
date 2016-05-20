require_relative 'base_language_handler'

module LanguageHandler
  class PythonLanguageHandler < BaseLanguageHandler
    def lang_cname
      'py'
    end

    private

    def execute(file)
      execute_with_suppressed_output("python #{file}")
    end
  end
end