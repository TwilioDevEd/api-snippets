Dir["#{File.dirname(__FILE__)}/../language_handler/*.rb"].each { |file| require File.expand_path(file) }

module Model
  class Snippet
    SERVER_LANGUAGES = [
      LanguageHandler::Java::LANG_CNAME,
      LanguageHandler::Java6::LANG_CNAME,
      LanguageHandler::Java7::LANG_CNAME,
      LanguageHandler::Ruby::LANG_CNAME,
      LanguageHandler::Ruby4::LANG_CNAME,
      LanguageHandler::Ruby5::LANG_CNAME,
      LanguageHandler::Node::LANG_CNAME,
      LanguageHandler::Php::LANG_CNAME,
      LanguageHandler::Php4::LANG_CNAME,
      LanguageHandler::Php5::LANG_CNAME,
      LanguageHandler::Python::LANG_CNAME,
      LanguageHandler::Python5::LANG_CNAME,
      LanguageHandler::Python6::LANG_CNAME,
      LanguageHandler::Curl::LANG_CNAME,
      LanguageHandler::CurlXml::LANG_CNAME,
      LanguageHandler::CurlJson::LANG_CNAME,
      LanguageHandler::Csharp::LANG_CNAME,
      LanguageHandler::Csharp4::LANG_CNAME,
      LanguageHandler::Csharp5::LANG_CNAME
    ].freeze

    attr_reader :output_folder, :relative_folder, :source_folder, :title, :type, :testable, :name, :langs, :available_langs

    alias testable? testable

    def initialize(meta_json_path, test_model)
      @source_folder    = File.dirname(meta_json_path)
      @relative_folder  = @source_folder.sub(test_model.root_source_folder,"")
      @output_folder    = test_model.root_output_folder + @relative_folder
      json_object       = JSON.parse(File.read(meta_json_path))
      @testable         = json_object.fetch('testable', test_model.testable).to_s.downcase == 'true'
      @name             = File.basename(@source_folder)
      @type             = json_object.fetch('type', 'server').downcase
      @title            = json_object.fetch('title') { raise "#{meta_json_path} has no title" }
      @langs            = @type == 'server' ? SERVER_LANGUAGES : []
      @testable         = false unless @type == 'server'
      @available_langs  = {}

      Dir.glob("#{source_folder}/**") do |file|
        file_name = File.basename(file)
        match = file.match(/^[^\.]+\.(.+$)/)
        lang = match.nil? ? '' : match.captures.first
        @available_langs.merge!(lang => file_name) if @langs.include?(lang)
      end
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
