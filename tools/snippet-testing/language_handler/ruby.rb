require_relative 'base_handler'

module LanguageHandler
  class Ruby < BaseHandler
    LANG_CNAME = 'rb'.freeze

    private

    def execute_command(file)
      execute_with_suppressed_output(
        Commands.run_file_command(file, dependencies_directory),
        file
      )
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

    class Commands
      class << self
        def run_file_command(file, dependencies_directory)
          if use_rvm?
            "rvm @#{dependencies_directory} do ruby #{file}"
          else
            "ruby #{file}"
          end
        end

        def install_ruby_dependencies_command(version)
          if user_rvm?
            "rvm gemset create #{version} && rvm @#{version} do gem install twilio-ruby -v #{version}"
          else
            "gem install twilio-ruby -v #{version}"
          end
        end

        private

        def use_rvm?
          ENV['SKIP_RVM'].nil? || ENV['SKIP_RVM'].downcase == 'false'
        end
      end
    end
  end
end
