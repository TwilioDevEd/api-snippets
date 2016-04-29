require 'fileutils'

module LanguageHandler
  class BaseLanguageHandler
    TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
    TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']

    def initialize(base_path)
      @base_path = base_path
    end

    def replace_and_relocate(path)
      file = File.open(File.expand_path(path))
      content = file.read
      write_content(text_with_credentials(content), path)
    end

    private

    attr_reader :base_path

    def text_with_credentials(file_content)
      replaced = file_content.gsub('{{ account_sid }}', TWILIO_ACCOUNT_SID)
      replaced.gsub('{{ auth_token }}', TWILIO_AUTH_TOKEN)
    end

    def write_content(content, path)
      dir_name  = base_path + File.dirname(path)
      file_name = File.basename(path)
      FileUtils.mkdir_p("#{dir_name}/#{language_directory}") unless Dir.exist?("#{dir_name}/#{language_directory}")

      new_file = File.new("#{dir_name}/#{language_directory}/#{file_name}", 'w+')
      new_file.write(content)
      new_file.close
    end

    def language_directory
      'undefined_dir'
    end
  end
end
