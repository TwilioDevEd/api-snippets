require_relative 'base_language_handler'

module LanguageHandler
  class PythonLanguageHandler < BaseLanguageHandler
    def language_directory
      'py'
    end
  end
end