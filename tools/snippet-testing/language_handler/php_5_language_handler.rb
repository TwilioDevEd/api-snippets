require_relative 'php_language_handler'

module LanguageHandler
  class Php5LanguageHandler < PhpLanguageHandler
    LANG_CNAME = '5.x.php'.freeze
  end
end
