require_relative 'base_language_handler'

module LanguageHandler
  class PhpLanguageHandler < BaseLanguageHandler
    def language_directory
      'php'
    end
  end
end