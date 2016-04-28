require_relative 'base_language_executor'

module LanguageExecutor
  class CurlLanguageExecutor < BaseLanguageExecutor
    def test_snippet(path)
      Dir.glob(path + '/*.curl') do |file|
        puts file
      end
    end
  end
end