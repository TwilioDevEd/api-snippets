require_relative 'java'

module LanguageHandler
  class Java7 < Java
    LANG_CNAME             = '7.x.java'.freeze
    TEST_CLASS_NAME        = 'Example7'.freeze
    TWILIO_LIBRARY_VERSION = '7'.freeze

    private

    def execute(file)
      execute_command(file)
    end

    def get_dependencies
      Model::Dependency.new.get_java_7_jars
    end

    def excluded_twiml_nodes
      ['/Response/Message/Body', '/Response/Dial/Number']
    end

    def test_class_name
      TEST_CLASS_NAME
    end
  end
end
