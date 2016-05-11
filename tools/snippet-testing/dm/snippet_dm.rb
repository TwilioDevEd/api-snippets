class SnippetModel

  attr_reader :folderPath, :filesPathPrefix, :title, :type, :testeable, :name, :langs, :availableLangs

  def initialize(metaJsonPath)
    @folderPath = File.dirname(metaJsonPath)
    json_object = JSON.parse(File.read(metaJsonPath))
    @testeable = json_object.fetch('test', 'false').downcase == 'true'
    @name = File.basename(@folderPath)
    @type = json_object.fetch('type', 'mobile').downcase
    @langs = []
    @filesPathPrefix = "#{@folderPath}/#{@name}"
    case @type
      when "server"
        @langs.push("py")
        @langs.push("rb")
        @langs.push("js")
        @langs.push("curl")
        @langs.push("php")
        @langs.push("java")
        @langs.push("cs")
      else
        @testeable = false
    end
    @availableLangs = Hash.new
    @files.each do |lang|
      if(File.exists?("#{filesPathPrefix}.#{lang}"))
        @availableLangs.push(lang)
      end
    end 
  end

  def get_filepath(lang_cname)
    if availableLangs.has_value(lang)
      "#{filesPathPrefix}.#{lang}"
    end
  end

  def to_s
    "#{@folderPath}(#{type})"
  end

end