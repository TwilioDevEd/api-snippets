require_relative 'java'

module LanguageHandler
  class Java6 < Java
    LANG_CNAME             = '6.x.java'.freeze
    TWILIO_LIBRARY_VERSION = '6'.freeze

    private

    def execute(file)
      execute_command(file)
    end
  end
end
