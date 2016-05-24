require_relative 'base_language_handler'

module LanguageHandler
  class JavaLanguageHandler < BaseLanguageHandler
    private

    def execute(file)
      Dir.chdir(File.dirname(file)) do
        execute_with_suppressed_output('gradle build')
      end
    end

    def lang_cname
      'java'
    end

    def text_with_replacements(file_content)
      text_with_example_class_name(text_with_credentials(file_content))
    end

    def text_with_example_class_name(file_content)
      file_content.gsub(/^public class\s.+\s*{\s*$/, 'public class Example {')
    end

    def write_content(content, path)
      java_base_dir = base_path + File.dirname(path)

      FileUtils.mkdir_p("#{java_base_dir}/src/main/java/") unless Dir.exist?("#{java_base_dir}/src/main/java/")
      new_file = File.new("#{java_base_dir}/src/main/java/Example.java", 'w+')
      new_file.write(content)
      new_file.close
      FileUtils.cp("#{File.dirname(__FILE__)}/file-templates/build.gradle", "#{java_base_dir}/build.gradle")
    end
  end
end
