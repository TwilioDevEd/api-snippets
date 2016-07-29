require_relative 'java_language_handler'

module LanguageHandler
  class Java7LanguageHandler < JavaLanguageHandler
    LANG_CNAME             = '7.x.java'.freeze
    TWILIO_LIBRARY_VERSION = '7'.freeze
  end
end
