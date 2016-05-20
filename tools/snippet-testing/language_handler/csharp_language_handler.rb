require_relative 'base_language_handler'

module LanguageHandler
  class CsharpLanguageHandler < BaseLanguageHandler

    def lang_cname
      'cs'
    end

    private

    def execute(file)
      command = dependencies.inject('mcs') do |cmd, path|
        cmd << " -r:#{path}"
      end
      execute_with_suppressed_output("#{command} #{file}")
    end
  end
end