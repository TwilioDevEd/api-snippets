require_relative 'java'

module LanguageHandler
  class Java7 < Java
    LANG_CNAME             = '7.x.java'.freeze
    TWILIO_LIBRARY_VERSION = '7'.freeze

    private

    def execute(file)
      execute_command(file)
    end
  end
end
