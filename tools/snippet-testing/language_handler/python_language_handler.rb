require_relative 'base_language_handler'

module LanguageHandler
  class PythonLanguageHandler < BaseLanguageHandler
    private

    def text_with_replacements(file_content)
      text_with_custom_header(file_content)
    end

    def text_with_custom_header(file_content)
      file_content.prepend(
        "import twilio.rest.resources.base\n"\
        "import sys\n"\
        "twilio.rest.resources.base.get_cert_file = lambda:  None\n"\
        "sys.modules['twilio.rest.base.resources'] = twilio.rest.resources.base"\
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
