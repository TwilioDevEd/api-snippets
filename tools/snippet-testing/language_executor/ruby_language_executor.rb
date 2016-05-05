require_relative 'base_language_executor'

module LanguageExecutor
  class RubyLanguageExecutor < BaseLanguageExecutor
    private

    def execute(file)
      execute_with_suppressed_output("ruby #{file}")
    end
  end
end