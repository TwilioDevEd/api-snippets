module Model
  class SnippetModel
    SERVER_LANGUAGES = [
      'py',
      'rb',
      'js',
      'curl',
      'xml.curl',
      'json.curl',
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
      @testable         = false unless @type == 'server'
      @available_langs = {}

      Dir.glob("#{folder_path}/**") do |file|
        lang = File.extname(file)[1..-1]
        if lang == 'curl'
          match = file.match(/\.(.+\.curl)/)
          lang = match.captures.first unless match.nil?
        end
        @available_langs.merge!(lang => File.basename(file)) if @langs.include?(lang)
      end
    end

    def get_filepath(lang_cname)
      "#{folder_path}/#{available_langs.fetch(lang_cname)}" if available_langs.key?(lang_cname)
    end

    def get_output_filepath(lang_cname)
      @output_path + get_filepath(lang_cname)
    end

    def to_s
      "#{@name}(#{type})"
    end
  end
end
