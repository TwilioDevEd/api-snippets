require_relative 'base_language_handler'

module LanguageHandler
  class CurlLanguageHandler < BaseLanguageHandler
    def language_directory
      'curl'
    end
  end
end