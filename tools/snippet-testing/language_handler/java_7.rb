require_relative 'java'

module LanguageHandler
  class Java7 < Java
    LANG_CNAME             = '7.x.java'.freeze
    TWILIO_LIBRARY_VERSION = '7'.freeze

    private

    def execute(file)
      execute_command(file)
    end

    def excluded_twiml_nodes
      ['/Response/Message/Body', '/Response/Dial/Number']
    end
  end
end
