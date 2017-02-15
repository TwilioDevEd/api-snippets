require_relative 'php'

module LanguageHandler
  class Php4 < Php
    LANG_CNAME = '4.x.php'.freeze

    private

    def execute(file)
      execute_command(file)
    end
  end
end
