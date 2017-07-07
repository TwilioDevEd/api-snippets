require_relative 'base_handler'

module LanguageHandler
  class Ruby < BaseHandler
    LANG_CNAME = 'rb'.freeze

    def initialize(dependencies_directory: Dir.pwd, dependencies: [], version_manager: 'RVM')
      super(dependencies_directory, dependencies)
      @version_manager = version_manager
    end

    private

    def execute_command(file)
      execute_with_suppressed_output(
        build_execute_command(file),
        file
      )
    end

    def build_execute_command(file)
      if @version_manager == "RVM"
        "rvm @#{dependencies_directory} do ruby #{file}"
      else
        "ruby #{file}"
      end
    end

    def text_with_specific_replacements(file_content)
      text_with_custom_header(file_content)
    end

    def text_with_custom_header(file_content)
      file_content.prepend(
        "require 'openssl'\n"\
        "OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE\n"
      )
    end
  end
end
