require_relative 'base_language_executor'

module LanguageExecutor
  class PhpLanguageExecutor < BaseLanguageExecutor
    def execute(file)
      execute_with_suppressed_output("php #{file}")
    end
  end
end