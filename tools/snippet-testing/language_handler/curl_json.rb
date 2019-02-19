require_relative 'curl'

module LanguageHandler
  class CurlJson < Curl
    LANG_CNAME = 'json.curl'.freeze

    private

    def execute(file)
      execute_command(file)
    end
  end
end
