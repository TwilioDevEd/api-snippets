require_relative 'java_language_handler'

module LanguageHandler
  class Java6LanguageHandler < JavaLanguageHandler
    LANG_CNAME             = '6.x.java'.freeze
    TWILIO_LIBRARY_VERSION = '6'.freeze
  end
end
