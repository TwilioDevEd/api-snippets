require 'fileutils'

module LanguageExecutor
  class BaseLanguageExecutor
    def test_snippet(path)
      raise 'Must implement test_snippet method'
    end
  end
end
