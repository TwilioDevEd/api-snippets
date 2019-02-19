require_relative 'base_handler'

module LanguageHandler
  class Csharp < BaseHandler
    LANG_CNAME = 'cs'.freeze

    private

    def execute_command(file)
      command = "#{compile_command} #{file} -warn:0" \
                "#{test_output_command_for(file) if @test_output}"
      execute_with_suppressed_output(command, file)
    end

    def test_output_command_for(file)
      ' && rm -rf App.app' \
      " && #{package_command} -m:2 -o:." \
      "    -n:App -a:#{file.sub(/\.cs\Z/, '.exe')}" \
      ' && mono App.app/Contents/Resources/App.exe'
    end

    def build_command(command)
      dependencies.inject(command) do |cmd, path|
        cmd << " -r:#{dependencies_directory}/#{path}"
      end
    end

    def package_command
      @package_command ||= build_command('macpack')
    end

    def compile_command
      @compile_command ||= build_command('mcs')
    end
  end
end
