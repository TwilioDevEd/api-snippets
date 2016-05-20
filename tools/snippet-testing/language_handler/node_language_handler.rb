require_relative 'base_language_handler'

module LanguageHandler
  class NodeLanguageHandler < BaseLanguageHandler
    def lang_cname
      'js'
    end

    private

    def execute(file)
      execute_with_suppressed_output("node #{file}")
    end
  end
end