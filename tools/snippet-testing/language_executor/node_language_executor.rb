require_relative 'base_language_executor'

module LanguageExecutor
  class NodeLanguageExecutor < BaseLanguageExecutor
    private

    def execute(file)
      system("node", file)
    end
  end
end