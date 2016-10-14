require_relative 'csharp'

module LanguageHandler
  class Csharp5 < Csharp
    LANG_CNAME = '5.x.cs'.freeze

    private

    def execute(file)
      execute_command(file)
    end
  end
end
