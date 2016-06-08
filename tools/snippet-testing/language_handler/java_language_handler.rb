require_relative 'base_language_handler'

module LanguageHandler
  class JavaLanguageHandler < BaseLanguageHandler

    TEST_CLASS_NAME = "Example".freeze

    def execute(file)
      Dir.chdir(File.dirname(file)) do
        execute_with_suppressed_output('gradle build')
      end
    end

    def lang_cname
      'java'
    end

    def text_with_specific_replacements(file_content)
      text_with_example_class_name(file_content)
    end

    def text_with_example_class_name(file_content)
      file_content.gsub(/^public class\s.+\s*{\s*$/, "public class #{TEST_CLASS_NAME} {")
    end

    def write_content(content, output_file)
      output_dir = File.dirname(output_file)
      FileUtils.mkdir_p("#{output_dir}/src/main/java/") unless Dir.exist?("#{output_dir}/src/main/java/")
      new_file = File.new("#{output_dir}/src/main/java/#{TEST_CLASS_NAME}.java", 'w+')
      new_file.write(content)
      new_file.close
      FileUtils.cp("#{File.dirname(__FILE__)}/file-templates/build.gradle", "#{output_dir}/build.gradle")
    end
  end
end
