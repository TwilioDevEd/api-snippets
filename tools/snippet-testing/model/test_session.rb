require 'yaml'

module Model
  class TestSession
    OUTPUT_FOLDER = 'testable_snippets'.freeze

    attr_reader :testable, :source_folder, :output_folder, :root_output_folder, :relative_folder, :root_source_folder

    alias testable? testable

    def initialize(meta_yaml_path = "test.yml", parent_model = nil)
      yaml_exists = File.file?(meta_yaml_path)
      @source_folder = File.dirname(meta_yaml_path)
      @root_source_folder = parent_model.nil? ? Dir.pwd : parent_model.root_source_folder
      @relative_folder =@source_folder.sub(root_source_folder, "")
      @testable = parent_model.nil? ? false : parent_model.testable
      @root_output_folder = OUTPUT_FOLDER
      if yaml_exists
        yaml_object = YAML.load(File.read(meta_yaml_path))
        @testable = yaml_object.fetch("testable", @testable).to_s.downcase == 'true'
        @root_output_folder = yaml_object.fetch("output", parent_model.root_output_folder)
      end
      @output_folder = root_output_folder + @relative_folder
    end

    def to_s
      "[TEST:#{@testable?'Enable':'Disable'}]\t#{relative_folder}"
    end
  end
end
