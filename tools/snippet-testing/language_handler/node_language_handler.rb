require_relative 'base_language_handler'

module LanguageHandler
  class NodeLanguageHandler < BaseLanguageHandler
    private

    def lang_cname
      'js'
    end

    def execute(file)
      execute_with_suppressed_output("node #{file}")
    end
  end
end
