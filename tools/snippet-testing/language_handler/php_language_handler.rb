require_relative 'base_language_handler'

module LanguageHandler
  class PhpLanguageHandler < BaseLanguageHandler
    def initialize(base_path)
      super(base_path)
      @autoload_path = File.expand_path(base_path) + '/../vendor/autoload.php'
    end

    private

    attr_reader :autoload_path

    def text_with_replacements(file_content)
      text_require_autoload(text_with_credentials(file_content))
    end

    def text_require_autoload(file_content)
      replaced = file_content.gsub(/^require.{1,}$/, '')
      replaced.gsub('<?php', "require '#{autoload_path}';").prepend("<?php\n")
    end

    def language_directory
      'php'
    end
  end
end