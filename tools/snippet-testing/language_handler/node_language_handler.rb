require_relative 'base_language_handler'

module LanguageHandler
  class NodeLanguageHandler < BaseLanguageHandler
    def language_directory
      'js'
    end
  end
end