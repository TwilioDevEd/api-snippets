require_relative 'base_language_handler'

module LanguageHandler
  class CsharpLanguageHandler < BaseLanguageHandler
    LANG_CNAME = 'cs'.freeze

    private

    def execute(file)
      execute_with_suppressed_output("#{compile_command} #{file}")
    end

    def compile_command
      @compile_command ||= dependencies.inject('mcs') do |cmd, path|
        cmd << " -r:#{dependencies_directory}/#{path}"
      end
    end
  end
end
