require_relative 'base_handler'

module LanguageHandler
  class Java < BaseHandler
    LANG_CNAME             = 'java'.freeze
    TWILIO_LIBRARY_VERSION = '6'.freeze

    private

    def execute_command(file)
      dir_name = File.dirname(file)
      classpath = get_dependencies.map do |dependency|
        "#{dependencies_directory}#{dependency}"
      end.join ':'

      cmd = "javac -cp #{classpath} #{dir_name}/#{test_class_name}.java"
      if @test_output
        cmd += " && java -cp '#{dir_name}:#{classpath}' #{test_class_name}"
      end
      execute_with_suppressed_output(cmd, file)
    end

    def get_dependencies
      raise 'This method must me implemented in sub classes'
    end

    def test_class_name
      raise 'This method must me implemented in sub classes'
    end

    def text_with_specific_replacements(file_content)
      text_with_example_class_name(file_content)
    end

    def text_with_example_class_name(file_content)
      file_content.gsub(/^public class\s[^\s{]+/, "public class #{test_class_name}")
    end

    def write_content(content, output_file)
      dir_name = File.dirname(output_file)
      FileUtils.mkdir_p(dir_name.to_s) unless Dir.exist?(dir_name.to_s)
      new_file = File.new("#{dir_name}/#{test_class_name}.java", 'w+')
      new_file.write(content)
      new_file.close
    end
  end
end
