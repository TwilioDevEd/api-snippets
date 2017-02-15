require_relative 'python'

module LanguageHandler
  class Python6 < Python
    LANG_CNAME = '6.x.py'.freeze

    private

    def execute(file)
      execute_command(file)
    end

    def text_with_custom_header(file_content)
      cert_path = ENV['FAKE_CERT_PATH']
      file_content.prepend(
        "import twilio.http\n"\
        "import sys\n"\
        "twilio.http.get_cert_file = lambda: '#{cert_path}'\n"\
        "sys.modules['twilio.http'] = twilio.http\n"
      )
    end
  end
end
