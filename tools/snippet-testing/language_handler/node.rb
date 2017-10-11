require_relative 'base_handler'

module LanguageHandler
  class Node < BaseHandler
    LANG_CNAME = 'js'.freeze

    private

    def execute_command(file)
      execute_with_suppressed_output(
        "NODE_TLS_REJECT_UNAUTHORIZED=0 NODE_PATH=#{dependencies_directory} node #{file}",
        file
      )
    end
  end
end
