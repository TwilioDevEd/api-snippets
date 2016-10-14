require_relative 'base_handler'

module LanguageHandler
  class Php < BaseHandler
    LANG_CNAME = 'php'.freeze

    def initialize(dependencies_directory = nil)
      super(dependencies_directory)
      @autoload_path = "#{dependencies_directory}/vendor/autoload.php"
    end

    private

    attr_reader :autoload_path

    def execute_command(file)
      execute_with_suppressed_output("php #{file}", file)
    end

    def text_with_specific_replacements(file_content)
      text_with_break_loops(text_require_autoload(file_content))
    end

    def text_with_break_loops(file_content)
      file_content.gsub(
        /foreach\s?\((.+)\)\s?\{(.+)\}$/m,
        "foreach(\\1) {\\2    break;\n}"
      )
    end

    def text_require_autoload(file_content)
      replaced = file_content.gsub(/^require.{1,}$/, '')
      replaced.gsub('<?php', "require '#{autoload_path}';\n").prepend("<?php\n")
    end
  end
end
