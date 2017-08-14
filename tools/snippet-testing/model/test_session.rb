require 'yaml'

module Model
  class TestSession
    OUTPUT_FOLDER = 'testable_snippets'.freeze

    attr_reader :testable, :source_folder, :output_folder, :root_output_folder, :relative_folder, :root_source_folder, :test_output, :exclude_languages

    alias testable? testable

    def initialize(meta_yaml_path = 'test.yml', parent_model = nil, test_default = false)
      yaml_exists = File.file?(meta_yaml_path)
      @source_folder = File.dirname(meta_yaml_path)
      @root_source_folder = parent_model.nil? ? Dir.pwd : parent_model.root_source_folder
      @relative_folder = @source_folder.sub(root_source_folder, '')
      @testable = parent_model.nil? ? test_default : parent_model.testable
      @test_output = parent_model.nil? ? false : parent_model.test_output
      @exclude_languages = []
      @root_output_folder = OUTPUT_FOLDER
      if yaml_exists
        yaml_object = YAML.safe_load(File.read(meta_yaml_path))
        @testable = yaml_object.fetch('testable', @testable).to_s.casecmp('true').zero?
        @test_output = yaml_object.fetch('test_output', @test_output)
        @exclude_languages = yaml_object.fetch('exclude_languages', @exclude_languages) if @testable
        @root_output_folder = yaml_object.fetch('output', parent_model.root_output_folder)
      end
      @output_folder = root_output_folder + @relative_folder
    end

    def to_s
      excluding = " excluding #{@exclude_languages}" unless @exclude_languages.empty?
      "[TEST:#{@testable ? 'Enable' : 'Disable'}#{' with output' if @testable && @test_output}#{excluding}]\t#{relative_folder}"
    end
  end
end
