require_relative 'base_language_executor'

module LanguageExecutor
  class RubyLanguageExecutor < BaseLanguageExecutor
    private

    def execute(file)
      system("ruby", file)
    end
  end
end