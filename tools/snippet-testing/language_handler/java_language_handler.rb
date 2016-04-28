require_relative 'base_language_handler'

module LanguageHandler
  class JavaLanguageHandler < BaseLanguageHandler
    def language_directory
      'java'
    end
  end
end