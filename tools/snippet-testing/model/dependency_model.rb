require 'fileutils'

module Model
  class DependencyModel
    DEP_DIR_NAME    = "#{Dir.pwd}/tools/dependencies".freeze
    CSHARP_NAME     = 'csharp'.freeze
    NUGET_FILE_NAME = 'NuGet.exe'.freeze
    PHP_NAME        = 'php'.freeze

    AVAILABLE_LIBRARY_VERSION = {
      CSHARP_NAME => ['4.7.2'],
      PHP_NAME    => ['4.10', '5.0.0-RC7']
    }.freeze

    CSHARP_DEPENDENCIES = {
      AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][0] => [
        { name: 'Twilio', version: '4.7.2' },
        { name: 'Twilio.Pricing', version: '1.1.0' },
        { name: 'Twilio.IpMessaging', version: '1.2.0' },
        { name: 'Twilio.TaskRouter', version: '2.3.0' },
        { name: 'Twilio.Auth', version: '1.2.0' }
      ]
    }.freeze

    RUBY_DEPENDENCIES = [
      { name: 'twilio-ruby', version: '4.11.1' }
    ].freeze

    NODE_DEPENDENCIES = [
      { name: 'twilio', version: '2.9.1' }
    ].freeze

    PYTHON_DEPENDENCIES = [
      { name: 'twilio', version: '5.4.0' }
    ].freeze

    def self.install_dependencies
      new.install_dependencies
    end

    def install_dependencies
      FileUtils.mkdir_p(DEP_DIR_NAME)

      Dir.chdir(DEP_DIR_NAME) do
        install_csharp_dependencies
        install_php_dependencies
        install_ruby_dependencies
        install_node_dependencies
        install_python_dependencies
      end
    end

    def self.php_4_path
      php_4_path = AVAILABLE_LIBRARY_VERSION[PHP_NAME][0]
      "#{DEP_DIR_NAME}/#{PHP_NAME}/#{php_4_path}"
    end

    def self.php_5_path
      php_5_path = AVAILABLE_LIBRARY_VERSION[PHP_NAME][1]
      "#{DEP_DIR_NAME}/#{PHP_NAME}/#{php_5_path}"
    end

    def self.csharp_path
      csharp_path = AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][0]
      "#{DEP_DIR_NAME}/#{CSHARP_NAME}/#{csharp_path}"
    end

    private

    def install_python_dependencies
      PYTHON_DEPENDENCIES.each do |dependency|
        system("sudo pip install #{dependency[:name]}==#{dependency[:version]}")
      end
    end

    def install_node_dependencies
      NODE_DEPENDENCIES.each do |dependency|
        system("sudo npm install -g #{dependency[:name]}@#{dependency[:version]}")
      end
    end

    def install_ruby_dependencies
      RUBY_DEPENDENCIES.each do |dependency|
        system("gem install #{dependency[:name]} -v #{dependency[:version]}")
      end
    end

    def install_php_dependencies
      AVAILABLE_LIBRARY_VERSION[PHP_NAME].each do |version|
        install_language_version(PHP_NAME, version) do
          unless File.exist?('composer.lock')
            system("composer require twilio/sdk:#{version}")
          end
        end
      end
    end

    def install_csharp_dependencies
      unless File.exist?(NUGET_FILE_NAME)
        system("wget https://dist.nuget.org/win-x86-commandline/v3.4.4/#{NUGET_FILE_NAME}")
      end

      AVAILABLE_LIBRARY_VERSION[CSHARP_NAME].each do |version|\
        if version.match(/^4\../)
          install_language_version(CSHARP_NAME, version) do
            CSHARP_DEPENDENCIES[AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][0]].each do |dependency|
              next if Dir.exist?("#{dependency[:name]}.#{dependency[:version]}")
              system(
                "sudo mono #{DEP_DIR_NAME}/#{NUGET_FILE_NAME} install #{dependency[:name]} -Version #{dependency[:version]}"
              )
            end
          end
        end
      end
    end

    def install_language_version(language, version)
      new_dir = "#{language}/#{version}"

      FileUtils.mkdir_p(new_dir)
      Dir.chdir(new_dir) do
        yield
      end
    end
  end
end

if __FILE__ == $0
  Model::DependencyModel.install_dependencies
end
