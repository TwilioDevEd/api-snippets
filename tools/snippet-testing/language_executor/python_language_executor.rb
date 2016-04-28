require_relative 'base_language_executor'

module LanguageExecutor
  class PythonLanguageExecutor < BaseLanguageExecutor
    def test_snippet(path)
      Dir.glob("#{path}**") do |file|
        system("python", file)
      end
    end
  end
end