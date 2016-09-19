require_relative 'base_handler'

module LanguageHandler
  class Python < BaseHandler
    LANG_CNAME = 'py'.freeze

    private

    def text_with_specific_replacements(file_content)
      text_with_custom_header(file_content)
    end

    def text_with_custom_header(file_content)
      cert_path = ENV['FAKE_CERT_PATH']
      file_content.prepend(
        "import twilio.rest.resources.base\n"\
        "import sys\n"\
        "twilio.rest.resources.base.get_cert_file = lambda: '#{cert_path}'\n"\
        "sys.modules['twilio.rest.base.resources'] = twilio.rest.resources.base\n"
      )
    end

    def execute(file)
      command = bash_string_command(
        'source /usr/local/bin/virtualenvwrapper.sh &&'\
        " workon #{dependencies_directory} &&"\
        " python #{file}"
      )
      execute_with_suppressed_output(command, file)
    end
  end
end
