require_relative 'base_language_handler'

module LanguageHandler
  class RubyLanguageHandler < BaseLanguageHandler
    def language_directory
      'rb'
    end
  end
end