require_relative 'base_language_handler'

module LanguageHandler
  class PhpLanguageHandler < BaseLanguageHandler
    def initialize(source_folder)
      super(source_folder)
      @autoload_path = "#{source_folder}/vendor/autoload.php"
    end

    private

    attr_reader :autoload_path

    def lang_cname
      'php'
    end

    def execute(file)
      execute_with_suppressed_output("php #{file}")
    end

    def text_with_specific_replacements(file_content)
      text_with_break_loops(text_require_autoload(file_content))
    end

    def text_with_break_loops(file_content)
      file_content.gsub(
        /foreach\s?\((.+)\)\s?\{(.+)\}/m,
        "foreach(\\1) {\\2    break;\n}"
      )
    end

    def text_require_autoload(file_content)
      replaced = file_content.gsub(/^require.{1,}$/, '')
      replaced.gsub('<?php', "require '#{autoload_path}';\n").prepend("<?php\n")
    end
  end
end
