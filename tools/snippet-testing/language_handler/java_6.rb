require_relative 'java'
require_relative '../model/dependency'

module LanguageHandler
  class Java6 < Java
    LANG_CNAME             = '6.x.java'.freeze
    TWILIO_LIBRARY_VERSION = '6'.freeze

    private

    def execute(file)
      execute_command(file)
    end

    def get_dependencies
      Model::Dependency.new().get_java_6_jars
    end
  end
end
