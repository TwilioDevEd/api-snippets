require_relative 'ruby'

module LanguageHandler
  class Ruby4 < Ruby
    LANG_CNAME = '4.x.rb'.freeze

    private

    def execute(file)
      execute_command(file)
    end
  end
end
