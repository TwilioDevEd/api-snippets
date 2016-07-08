require_relative 'curl_language_handler'

module LanguageHandler
  class CurlJsonLanguageHandler < CurlLanguageHandler
    LANG_CNAME = 'json.curl'.freeze
  end
end
