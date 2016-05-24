require_relative 'curl_language_handler'

module LanguageHandler
  class CurlXmlLanguageHandler < CurlLanguageHandler
    private

    def lang_cname
      'xml.curl'
    end
  end
end
