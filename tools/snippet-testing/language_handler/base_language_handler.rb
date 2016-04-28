require 'fileutils'

module LanguageHandler
  class BaseLanguageHandler
    TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
    TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']

    BASE_PATH = 'output/'

    def parse_file(path)
      file = File.open(File.expand_path(path))
      content = file.read
      write_content(text_with_credentials(content), path)
    end

    def text_with_credentials(file_content)
      replaced = file_content.gsub('{{ account_sid }}', TWILIO_ACCOUNT_SID)
      replaced.gsub('{{ auth_token }}', TWILIO_AUTH_TOKEN)
    end

    def write_content(content, path)
      dir_name = BASE_PATH + File.dirname(path)
      FileUtils.mkdir_p(dir_name) unless Dir.exist?(dir_name)

      new_file = File.new(BASE_PATH + path, 'w+')
      new_file.write(content)
      new_file.close
    end
  end
end
