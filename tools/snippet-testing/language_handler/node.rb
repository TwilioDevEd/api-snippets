require_relative 'base_handler'

module LanguageHandler
  class Node < BaseHandler
    LANG_CNAME = 'js'.freeze

    private

    def execute(file)
      execute_with_suppressed_output("node #{file}", file)
    end
  end
end
