require_relative 'java'
require_relative '../model/dependency'

module LanguageHandler
  class Java6 < Java
    LANG_CNAME             = '6.x.java'.freeze
    TEST_CLASS_NAME        = 'Example6'.freeze
    TWILIO_LIBRARY_VERSION = '6'.freeze

    private

    def execute(file)
      puts "Running Java 6.x on #{file}"
      execute_command(file)
    end

    def get_dependencies
      Model::Dependency.new.get_java_6_jars
    end

    def test_class_name
      TEST_CLASS_NAME
    end
  end
end
