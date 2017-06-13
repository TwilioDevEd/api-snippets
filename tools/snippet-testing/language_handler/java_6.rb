require_relative 'java'

module LanguageHandler
  class Java6 < Java
    LANG_CNAME             = '6.x.java'.freeze
    TWILIO_LIBRARY_VERSION = '6'.freeze

    private

    def execute(file)
      execute_command(file)
    end

    def execute_command(file)
      dir_name = File.dirname(file)
      execute_with_suppressed_output("javac -cp #{dependencies_directory}*.jar #{dir_name}/Example.java", file)

      # Dir.chdir("#{dir_name}/#{base_output_path}") do
      #   # execute_with_suppressed_output("gradle #{@test_output ? '-q run' : 'build'}", file)
      # end
    end

  end
end
