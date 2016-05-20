class SnippetModel

  attr_reader :output_path, :folderPath, :filesPathPrefix, :title, :type, :testable, :name, :langs, :availableLangs

  alias testable? testable

  def initialize(meta_json_path, output_path)
    @output_path = output_path
    @folderPath = File.dirname(meta_json_path)
    json_object = JSON.parse(File.read(meta_json_path))
    @testable = json_object.fetch('test', 'false').downcase == 'true'
    @name = File.basename(@folderPath)
    @type = json_object.fetch('type', 'mobile').downcase
    @langs = []
    @filesPathPrefix = "#{@folderPath}/#{@name}"
    case @type
      when "server"
        @langs.push("py")
        @langs.push("rb")
        @langs.push("js")
        @langs.push("xml.curl")
        @langs.push("json.curl")
        @langs.push("curl")
        @langs.push("php")
        @langs.push("java")
        @langs.push("cs")
      else
        @testable = false
    end
    @availableLangs = []
    @langs.each do |lang|
      if(File.exists?("#{filesPathPrefix}.#{lang}"))
        @availableLangs.push lang
      end
    end
  end

  def get_filepath(lang_cname)
    if availableLangs.include? lang_cname
      "#{filesPathPrefix}.#{lang_cname}"
    end
  end

  def get_output_filepath(lang_cname)
    @output_path + get_filepath(lang_cname)
  end

  def to_s
    "#{@name}(#{type})"
  end

end