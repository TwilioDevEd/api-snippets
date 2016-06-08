require_relative 'base_language_handler'

module LanguageHandler
  class PythonLanguageHandler < BaseLanguageHandler
    private

    def text_with_specific_replacements(file_content)
      text_with_custom_header(file_content)
    end

    def text_with_custom_header(file_content)
      cert_path = ENV['FAKE_CERT_PATH']
      file_content.prepend(
        "import twilio.rest.resources.base\n"\
        "import sys\n"\
        "twilio.rest.resources.base.get_cert_file = lambda:  '#{cert_path}'\n"\
        "sys.modules['twilio.rest.base.resources'] = twilio.rest.resources.base\n"
      )
    end

    def lang_cname
      'py'
    end

    def execute(file)
      execute_with_suppressed_output("python #{file}")
    end
  end
end
