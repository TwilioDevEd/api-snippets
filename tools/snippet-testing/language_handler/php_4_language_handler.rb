require_relative 'php_language_handler'

module LanguageHandler
  class Php4LanguageHandler < PhpLanguageHandler
    def lang_cname
      '4.php'
    end
  end
end
