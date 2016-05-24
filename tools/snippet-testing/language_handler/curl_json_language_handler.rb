require_relative 'curl_language_handler'

module LanguageHandler
  class CurlJsonLanguageHandler < CurlLanguageHandler
    private

    def lang_cname
      'json.curl'
    end
  end
end
