require_relative 'base_language_executor'

module LanguageExecutor
  class NodeLanguageExecutor < BaseLanguageExecutor
    private

    def execute(file)
      execute_with_suppressed_output("node #{file}")
    end
  end
end