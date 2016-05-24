module Model
  class SnippetModel
    SERVER_LANGUAGES = [
      'py',
      'rb',
      'js',
      'xml.curl',
      'json.curl',
      'curl',
      'php',
      'java',
      'cs'
    ].freeze

    attr_reader :output_path, :folder_path, :file_path_prefix, :title, :type, :testable, :name, :langs, :available_langs

    alias testable? testable

    def initialize(meta_json_path, output_path)
      json_object = JSON.parse(File.read(meta_json_path))

      @output_path      = output_path
      @folder_path      = File.dirname(meta_json_path)
      @testable         = json_object.fetch('test', 'false').downcase == 'true'
      @name             = File.basename(@folder_path)
      @type             = json_object.fetch('type', 'server').downcase
      @langs            = @type == 'server' ? SERVER_LANGUAGES : []
      @file_path_prefix = "#{@folder_path}/#{@name}"
      @testable         = false unless @type == 'server'

      @available_langs = @langs.inject([]) do |langs, lang|
        langs.push(lang) if File.exist?("#{file_path_prefix}.#{lang}")
        langs
      end
    end

    def get_filepath(lang_cname)
      "#{file_path_prefix}.#{lang_cname}" if available_langs.include? lang_cname
    end

    def get_output_filepath(lang_cname)
      @output_path + get_filepath(lang_cname)
    end

    def to_s
      "#{@name}(#{type})"
    end
  end
end
