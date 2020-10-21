require_relative 'python'

module LanguageHandler
  class Python6 < Python
    LANG_CNAME = '6.x.py'.freeze

    private

    def execute(file)
      execute_command(file)
    end

    def text_with_custom_header(file_content)
# To set up environmental variables, see http://twil.io/secure
      cert_path = ENV['FAKE_CERT_PATH']
      file_content.prepend(
        "from twilio.http.http_client import TwilioHttpClient\n"\
        "class FakerHttpClient(TwilioHttpClient):\n"\
        "    def __init__(self, *args, **kwargs):\n"\
        "         super(FakerHttpClient, self).__init__(*args, **kwargs)\n"\
        "         self.session.verify = '#{cert_path}'\n"\
      )
    end

    def replace_twilio_client_initialization(file_content)
      cert_path = ENV['FAKE_CERT_PATH']
      result = ''
      file_content.each_line do |line|
        result += line.include?('client = Client(') ?
           line.gsub!(')', ', http_client=FakerHttpClient())') : line
      end
      result
    end
  end
end
