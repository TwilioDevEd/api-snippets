require 'fileutils'
require 'timeout'

module LanguageHandler
  class BaseLanguageHandler
    DEFAULT_PLACEHOLDER_REPLACEMENT = 'SIDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'.freeze

    attr_reader :source_folder, :dependencies

    def initialize(source_folder, dependencies = [])
      @source_folder = source_folder
      @dependencies = dependencies
    end

    def replace_and_relocate(snippet, lang)
      input_file = snippet.get_input_file(lang)
      output_file = snippet.get_output_file(lang)
      content = text_with_replacements(File.open(input_file).read)
      write_content(content, output_file)
    end

    def test_snippet(snippet_model)
      path = snippet_model.get_output_file(lang_cname)
      ErrorLogger.instance.add_error(path) unless execute(path)
    end

    def execute(file)
      raise 'this method must be implemented in child clases'
    end

    def execute_with_suppressed_output(command)
      pid = Process.spawn("#{command} > /dev/null 2>&1")
      exit_code = 0
      begin
        Timeout.timeout(20) do
          _id, status = Process.wait2(pid)
          exit_code = status.exitstatus
        end
      rescue Timeout::Error
        puts 'process not finished in time, killing it'
        Process.kill('KILL', pid)
        exit_code = 1
      end
      success = exit_code == 0
      puts success ? "success [#{lang_cname}]".green : "failure [#{lang_cname}]".red
      success
    end

    def output_folder
      Model::TestSessionModel::OUTPUT_FOLDER
    end

    private

    def lang_cname
      raise 'undefined language name at #{__FILE__}'
    end

    def text_with_replacements(file_content)
      replaced = text_without_placeholders(file_content)
      text_with_specific_replacements(replaced)
    end

    def text_without_placeholders(file_content)
      file_content.gsub(/\{\{[^\{\}]+\}\}/, DEFAULT_PLACEHOLDER_REPLACEMENT)
    end

    def text_with_specific_replacements(file_content)
      file_content
    end

    def write_content(content, output_file)
      dir_name  = File.dirname(output_file)
      file_name = File.basename(output_file)
      FileUtils.mkdir_p(dir_name) unless Dir.exist?(dir_name)
      new_file = File.new(output_file, 'w+')
      new_file.write(content)
      new_file.close
    end
  end
end
