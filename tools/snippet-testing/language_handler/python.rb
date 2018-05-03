require_relative 'base_handler'

module LanguageHandler
  class Python < BaseHandler
    LANG_CNAME = 'py'.freeze

    def self.run_before_test(directory)
      dirs = ['./venv/*', './guides/*', './testable_snippets/*']
      exclude = dirs.map{|dir| "--exclude='#{dir}'"}
      Dir.chdir(directory) do
        output = `yapf #{exclude.join(' ')} -i -r . && flake8`
        if $? != 0
          abort(output)
        end
      end
    end

    private

    def execute_command(file)
      command = bash_string_command(
        'source /usr/local/bin/virtualenvwrapper.sh &&'\
        " workon #{dependencies_directory} &&"\
        " python #{file}"
      )
      execute_with_suppressed_output(command, file)
    end

    def text_with_specific_replacements(file_content)
      text_with_custom_header(file_content)
      replace_twilio_client_initialization(file_content)
    end
  end
end
