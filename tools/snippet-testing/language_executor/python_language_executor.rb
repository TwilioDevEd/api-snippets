require_relative 'base_language_executor'

module LanguageExecutor
  class PythonLanguageExecutor < BaseLanguageExecutor
    private

    def execute(file)
      system("python", file)
    end
  end
end