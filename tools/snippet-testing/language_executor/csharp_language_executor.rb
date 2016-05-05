require_relative 'base_language_executor'

module LanguageExecutor
  class CsharpLanguageExecutor < BaseLanguageExecutor
    def initialize(dependencies)
      @dependencies = dependencies
    end

    def test_snippet(path)
      Dir.glob("#{path}**") do |file|
        next unless File.extname(file) == '.cs'
        puts "Testing: #{file}"
        ErrorLogger.instance.add_error(file) unless execute(file)
      end
    end

    private

    attr_reader :dependencies

    def execute(file)
      command = dependencies.inject('mcs') do |cmd, path|
        cmd << " -r:#{path}"
      end
      execute_with_suppressed_output("#{command} #{file}")
    end
  end
end