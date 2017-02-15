require_relative 'node'

module LanguageHandler
  class Node2 < Node
    LANG_CNAME = '2.x.js'.freeze

    private

    def execute(file)
      execute_command(file)
    end
  end
end
