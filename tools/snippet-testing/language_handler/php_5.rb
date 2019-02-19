require_relative 'php'

module LanguageHandler
  class Php5 < Php
    LANG_CNAME = '5.x.php'.freeze

    private

    def execute(file)
      execute_command(file)
    end
  end
end
