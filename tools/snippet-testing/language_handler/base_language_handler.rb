require 'fileutils'

module LanguageHandler
  class BaseLanguageHandler
    TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
    TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']

    attr_reader :base_path, :dependencies

    def initialize(base_path, dependencies = [])
      @base_path = base_path
      @dependencies = dependencies
    end

    def replace_and_relocate(path)
      write_content(text_with_replacements(File.open(path).read), path)
    end

    def test_snippet(snippet_model)
      path = snippet_model.get_output_filepath(lang_cname)
      ErrorLogger.instance.add_error(path) unless execute(path)
    end

    def execute(file)
      raise 'this method must be implemented in child clases'
    end

    def execute_with_suppressed_output(command)
      exit_code = system("#{command} > /dev/null 2>&1")
      puts exit_code ? "success [#{lang_cname}]".green : "failure [#{lang_cname}]".red
      exit_code
    end

    private

    def lang_cname
      raise 'undefined language name at #{__FILE__}'
    end

    def text_with_replacements(file_content)
      file_content
    end

    def write_content(content, path)
      dir_name  = @base_path + (File.dirname path)
      file_name = File.basename(path)
      FileUtils.mkdir_p(dir_name) unless Dir.exist?(dir_name)
      new_file = File.new("#{dir_name}/#{file_name}", 'w+')
      new_file.write(content)
      new_file.close
    end
  end
end
