require_relative 'base_language_executor'

module LanguageExecutor
  class CsharpLanguageExecutor < BaseLanguageExecutor
    private

    def execute(file)
      execute_with_suppressed_output("mcs #{file}")
    end
  end
end