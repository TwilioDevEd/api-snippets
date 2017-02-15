require_relative 'curl'

module LanguageHandler
  class CurlXml < Curl
    LANG_CNAME = 'xml.curl'.freeze

    private

    def execute(file)
      execute_command(file)
    end
  end
end
