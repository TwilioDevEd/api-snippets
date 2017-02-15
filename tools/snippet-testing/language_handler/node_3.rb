require_relative 'node'

module LanguageHandler
  class Node3 < Node
    LANG_CNAME = '3.x.js'.freeze

    private

    def execute(file)
      execute_command(file)
    end
  end
end
