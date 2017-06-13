require_relative 'base_handler'

module LanguageHandler
  class Java < BaseHandler
    LANG_CNAME             = 'java'.freeze
    TEST_CLASS_NAME        = 'Example'.freeze
    TWILIO_LIBRARY_VERSION = '6'.freeze

    private

    def execute_command(file)
      dir_name = File.dirname(file)
      cmd = "javac -cp #{dependencies_directory}*.jar #{dir_name}/Example.java"
      if @test_output
        cmd += " && java -cp '#{dir_name}:#{dependencies_directory}#{get_filename}' Example"
      end
      execute_with_suppressed_output(cmd, file)
    end

    def get_filename
      raise 'This method must me implemented in sub classes'
    end

    def text_with_specific_replacements(file_content)
      text_with_example_class_name(file_content)
    end

    def text_with_example_class_name(file_content)
      file_content.gsub(/^public class\s[^\s{]+/, "public class #{TEST_CLASS_NAME}")
    end

    def write_content(content, output_file)
      dir_name = File.dirname(output_file)
      FileUtils.mkdir_p("#{dir_name}") unless Dir.exist?("#{dir_name}")
      new_file = File.new("#{dir_name}/#{TEST_CLASS_NAME}.java", 'w+')
      new_file.write(content)
      new_file.close
    end
  end
end
