Dir["#{File.dirname(__FILE__)}/../language_handler/*.rb"].each { |file| require File.expand_path(file) }

module Model
  class Snippet
    LANGUAGES = {
      java6:  [LanguageHandler::Java::LANG_CNAME, LanguageHandler::Java6::LANG_CNAME],
      java7:  [LanguageHandler::Java::LANG_CNAME, LanguageHandler::Java7::LANG_CNAME],
      php:    [LanguageHandler::Php::LANG_CNAME, LanguageHandler::Php4::LANG_CNAME, LanguageHandler::Php5::LANG_CNAME],
      ruby:   [LanguageHandler::Ruby::LANG_CNAME, LanguageHandler::Ruby4::LANG_CNAME, LanguageHandler::Ruby5::LANG_CNAME],
      node:   [LanguageHandler::Node::LANG_CNAME, LanguageHandler::Node2::LANG_CNAME, LanguageHandler::Node3::LANG_CNAME],
      csharp: [LanguageHandler::Csharp::LANG_CNAME, LanguageHandler::Csharp4::LANG_CNAME, LanguageHandler::Csharp5::LANG_CNAME],
      python: [LanguageHandler::Python::LANG_CNAME, LanguageHandler::Python5::LANG_CNAME, LanguageHandler::Python6::LANG_CNAME],
      curl:   [LanguageHandler::Curl::LANG_CNAME, LanguageHandler::CurlXml::LANG_CNAME, LanguageHandler::CurlJson::LANG_CNAME]
    }.freeze

    attr_reader :output_folder, :relative_folder, :source_folder, :type, :testable, :name, :langs, :available_langs, :test_output

    alias testable? testable

    def initialize(meta_json_path, test_model)
      @server_languages = get_valid_server_languages
      @source_folder    = File.dirname(meta_json_path)
      @relative_folder  = @source_folder.sub(test_model.root_source_folder,"")
      @output_folder    = test_model.root_output_folder + @relative_folder
      json_object       = JSON.parse(File.read(meta_json_path))
      @testable         = json_object.fetch('testable', test_model.testable).to_s.downcase == 'true'
      @name             = File.basename(@source_folder)
      @type             = json_object.fetch('type', 'server').downcase
      @langs            = @type == 'server' ? @server_languages : []
      @testable         = false unless @type == 'server'
      @test_output      = json_object.fetch('test_output', test_model.test_output)
      @available_langs  = {}

      Dir.glob("#{source_folder}/**") do |file|
        file_name = File.basename(file)
        match = file.match(/^[^\.]+\.(.+$)/)
        lang = match.nil? ? '' : match.captures.first
        @available_langs.merge!(lang => file_name) if @langs.include?(lang)
      end
    end

    def get_valid_server_languages
      server_languages = []
      snippet_languages = ENV['SNIPPET_LANGUAGE']

      unless snippet_languages.nil?
        snippet_languages.split(':').each do |language|
          server_languages += LANGUAGES.fetch(language.to_sym)
        end
      else
        server_languages = LANGUAGES.values.flatten.freeze
      end

      server_languages.uniq
    end

    def get_input_file(lang_cname)
      "#{source_folder}/#{available_langs.fetch(lang_cname)}" if available_langs.key?(lang_cname)
    end

    def get_output_file(lang_cname)
      "#{output_folder}/#{available_langs.fetch(lang_cname)}" if available_langs.key?(lang_cname)
    end

    def to_s
      "[#{type}\t]\t#{@output_folder}"
    end
  end
end
