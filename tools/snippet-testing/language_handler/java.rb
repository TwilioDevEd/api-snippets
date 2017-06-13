require_relative 'base_handler'

module LanguageHandler
  class Java < BaseHandler
    LANG_CNAME             = 'java'.freeze
    TEST_CLASS_NAME        = 'Example'.freeze
    TWILIO_LIBRARY_VERSION = '6'.freeze

    private

    def execute_command(file)
      dir_name = File.dirname(file)
      execute_with_suppressed_output("javac -cp #{dependencies_directory}*.jar #{dir_name}/Example.java", file)
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
      # FileUtils.cp(
      #   "#{File.dirname(__FILE__)}/#{gradle_file_path}",
      #   "#{output_dir}/build.gradle"
      # )
    end

    # def gradle_file_path
    #   "file-templates/build.#{self.class::TWILIO_LIBRARY_VERSION}.gradle"
    # end
    #
    def base_output_path
      "java/#{self.class::TWILIO_LIBRARY_VERSION}"
    end
  end
end
