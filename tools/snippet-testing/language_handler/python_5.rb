require_relative 'python'

module LanguageHandler
  class Python5 < Python
    LANG_CNAME = '5.x.py'.freeze

    private

    def execute(file)
      execute_command(file)
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
  end
end
