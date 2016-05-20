require_relative 'curl_language_handler'

module LanguageHandler
  class CurlXmlLanguageHandler < CurlLanguageHandler
    def lang_cname
      'xml.curl'
    end
  end
end