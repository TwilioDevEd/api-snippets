require_relative 'php_language_handler'

module LanguageHandler
  class Php5LanguageHandler < PhpLanguageHandler
    def lang_cname
      '5.php'
    end
  end
end
