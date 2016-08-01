require_relative 'base_language_handler'

module LanguageHandler
  class NodeLanguageHandler < BaseLanguageHandler
    LANG_CNAME = 'js'.freeze

    private

    def execute(file)
      execute_with_suppressed_output("node #{file}", file)
    end
  end
end
