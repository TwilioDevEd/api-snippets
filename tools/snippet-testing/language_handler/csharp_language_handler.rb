require_relative 'base_language_handler'

module LanguageHandler
  class CsharpLanguageHandler < BaseLanguageHandler
    private

    def lang_cname
      'cs'
    end

    def execute(file)
      execute_with_suppressed_output("#{compile_command} #{file}")
    end

    def compile_command
      @compile_command ||= dependencies.inject('mcs') do |cmd, path|
        cmd << " -r:#{source_folder}/nuget/#{path}"
      end
    end
  end
end
