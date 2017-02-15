require_relative 'base_handler'

module LanguageHandler
  class Csharp < BaseHandler
    LANG_CNAME = 'cs'.freeze

    private

    def execute_command(file)
      execute_with_suppressed_output("#{compile_command} #{file}", file)
    end

    def compile_command
      @compile_command ||= dependencies.inject('mcs') do |cmd, path|
        cmd << " -r:#{dependencies_directory}/#{path}"
      end
    end
  end
end
