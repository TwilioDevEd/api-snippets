require_relative 'base_language_executor'

module LanguageExecutor
  class PythonLanguageExecutor < BaseLanguageExecutor
    private

    def execute(file)
      execute_with_suppressed_output("python #{file}")
    end
  end
end