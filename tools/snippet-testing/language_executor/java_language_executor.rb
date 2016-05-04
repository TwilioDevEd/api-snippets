require_relative 'base_language_executor'

module LanguageExecutor
  class JavaLanguageExecutor < BaseLanguageExecutor
    def test_snippet(path)
      return unless File.directory?(path) && File.exist?("#{path}build.gradle")

      puts "Testing: #{path}"
      ErrorLogger.instance.add_error(path) unless execute(path)
    end

    private

    def execute(dir)
      Dir.chdir(dir) do
        execute_with_suppressed_output("gradle build")
      end
    end
  end
end