require_relative 'ruby'

module LanguageHandler
  class Ruby5 < Ruby
    LANG_CNAME = '5.x.rb'.freeze

    private

    def execute(file)
      execute_command(file)
    end
  end
end
