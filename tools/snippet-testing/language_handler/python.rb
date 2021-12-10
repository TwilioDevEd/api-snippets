require_relative 'base_handler'

module LanguageHandler
  class Python < BaseHandler
    LANG_CNAME = 'py'.freeze

    def self.run_before_test(directory)
      dirs = ['venv/*', 'guides/*', 'testable_snippets/*']
      exclude = dirs.map{|dir| "--exclude='#{dir}'"}
      Dir.chdir(directory) do
        output = `yapf #{exclude.join(' ')} -i -r . && flake8`
        if $? != 0
          abort(output)
        end
      end
    end

    private
    def text_with_custom_header(file_content)
      cert_path = ENV['FAKE_CERT_PATH']
      file_content.prepend(
        "import twilio.rest.resources.base\n"\
        "import sys\n"\
        "twilio.rest.resources.base.get_cert_file = lambda: '#{cert_path}'\n"\
        "sys.modules['twilio.rest.base.resources'] = twilio.rest.resources.base\n"
      )
    end
    def replace_twilio_client_initialization(file_content)
      cert_path = ENV['FAKE_CERT_PATH']
      file_content.gsub! 'Client(account_sid, auth_token)',
        'Client(account_sid, auth_token, http_client=FakerHttpClient())' || file_content
    end
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
