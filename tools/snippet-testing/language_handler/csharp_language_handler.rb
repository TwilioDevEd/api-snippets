require_relative 'base_language_handler'

module LanguageHandler
  class CsharpLanguageHandler < BaseLanguageHandler
    def language_directory
      'cs'
    end
  end
end