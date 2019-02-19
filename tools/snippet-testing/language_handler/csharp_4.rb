require_relative 'csharp'

module LanguageHandler
  class Csharp4 < Csharp
    LANG_CNAME = '4.x.cs'.freeze

    private

    def execute(file)
      execute_command(file)
    end
  end
end
