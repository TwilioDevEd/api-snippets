require 'fileutils'

module Model
  class Dependency
    DEP_DIR_NAME    = "#{Dir.pwd}/tools/dependencies".freeze
    CSHARP_NAME     = 'csharp'.freeze
    NUGET_FILE_NAME = 'NuGet.exe'.freeze
    PHP_NAME        = 'php'.freeze
    PYTHON_NAME     = 'python'.freeze
    RUBY_NAME       = 'ruby'.freeze
    NODE_NAME       = 'node'.freeze
    JAVA6_NAME      = 'java6'.freeze
    JAVA7_NAME      = 'java7'.freeze

    CS_V4 = '4.7.2'.freeze
    CS_V5 = '5.9.0'.freeze

    AVAILABLE_LIBRARY_VERSION = {
      CSHARP_NAME => ['4.x', CS_V5],
      PHP_NAME    => ['4.10', '5.16.0'],
      PYTHON_NAME => ['5.6.0', '6.9.0'],
      RUBY_NAME   => ['4.13.0', '5.5.0'],
      NODE_NAME   => ['2.11.0', '3.10.0'],
      JAVA6_NAME  => { group: 'com.twilio.sdk', name: 'twilio-java-sdk', version: '6.3.0', suffix: '-jar-with-dependencies' },
      JAVA7_NAME  => { group: 'com.twilio.sdk', name: 'twilio', version: '7.17.0', suffix: '-jar-with-dependencies' }
    }.freeze

    JAVA_DEPENDENCIES = {
      JAVA6_NAME => [],
      JAVA7_NAME => [
        { group: 'javax.servlet', name: 'javax.servlet-api', version: '3.1.0' }
      ]
    }.freeze

    CSHARP_DEPENDENCIES = {
      AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][0] => [
        { name: 'Twilio', version: CS_V4 },
        { name: 'Twilio.Pricing', version: '1.1.0' },
        { name: 'Twilio.Lookups', version: '1.1.0' },
        { name: 'Twilio.Monitor', version: '1.1.0' },
        { name: 'Twilio.IpMessaging', version: '1.2.0' },
        { name: 'Twilio.TaskRouter', version: '2.3.0' },
        { name: 'Twilio.Auth', version: '1.4.0' }
      ],
      AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][1] => [
        { name: 'Twilio', version: CS_V5 },
        { name: 'System.Xml.Linq', version: '3.5.0'},
        { name: 'JWT', version: '1.3.4' }
      ]
    }.freeze

    def self.install_dependencies
      new.install_dependencies
    end

    def install_dependencies
      dependencies = {
        csharp: -> { install_csharp_dependencies },
        php:    -> { install_php_dependencies },
        ruby:   -> { install_ruby_dependencies },
        node:   -> { install_node_dependencies },
        python: -> { install_python_dependencies },
        java6:  -> { install_java_dependencies(JAVA6_NAME) },
        java7:  -> { install_java_dependencies(JAVA7_NAME) },
        curl:   -> { puts 'nothing else to install' }
      }

      FileUtils.mkdir_p(DEP_DIR_NAME)

      Dir.chdir(DEP_DIR_NAME) do
# To set up environmental variables, see http://twil.io/secure
        snippet_languages = ENV['SNIPPET_LANGUAGE']
        if !snippet_languages.nil?
          snippet_languages.split(':').each do |language|
            dependencies.fetch(language.to_sym).call
          end
        else
          dependencies.values.each(&:call)
        end
      end
    end

    def self.java_7_path
      dependency = AVAILABLE_LIBRARY_VERSION[JAVA7_NAME]
      "#{DEP_DIR_NAME}/#{JAVA7_NAME}/#{dependency[:version]}/"
    end

    def self.java_6_path
      dependency = AVAILABLE_LIBRARY_VERSION[JAVA6_NAME]
      "#{DEP_DIR_NAME}/#{JAVA6_NAME}/#{dependency[:version]}/"
    end

    def self.php_4_path
      php_4_path = AVAILABLE_LIBRARY_VERSION[PHP_NAME][0]
      "#{DEP_DIR_NAME}/#{PHP_NAME}/#{php_4_path}"
    end

    def self.php_5_path
      php_5_path = AVAILABLE_LIBRARY_VERSION[PHP_NAME][1]
      "#{DEP_DIR_NAME}/#{PHP_NAME}/#{php_5_path}"
    end

    def self.csharp_4_path
      csharp_path = AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][0]
      "#{DEP_DIR_NAME}/#{CSHARP_NAME}/#{csharp_path}"
    end

    def self.csharp_5_path
      csharp_path = AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][1]
      "#{DEP_DIR_NAME}/#{CSHARP_NAME}/#{csharp_path}"
    end

    def self.csharp_4_dependencies
      [
        "Twilio.#{CS_V4}/lib/3.5/Twilio.Api.dll",
        'Twilio.Pricing.1.1.0/lib/3.5/Twilio.Pricing.dll',
        'Twilio.Lookups.1.1.0/lib/3.5/Twilio.Lookups.dll',
        'Twilio.Monitor.1.1.0/lib/3.5/Twilio.Monitor.dll',
        'Twilio.IpMessaging.1.2.0/lib/3.5/Twilio.IpMessaging.dll',
        'Twilio.TaskRouter.2.3.0/lib/3.5/Twilio.TaskRouter.dll',
        'Twilio.Auth.1.4.0/lib/3.5/Twilio.Auth.dll',
        'JWT.1.1/lib/3.5/JWT.dll',
        'RestSharp.105.2.2/lib/net35/RestSharp.dll',
        'Newtonsoft.Json.3.5.8/lib/35/Newtonsoft.Json.dll'
      ]
    end

    def self.csharp_5_dependencies
      [
        "Twilio.#{CS_V5}/lib/net35/Twilio.dll",
        'JWT.1.3.4/lib/3.5/JWT.dll',
        'Newtonsoft.Json.9.0.1/lib/net35/Newtonsoft.Json.dll'
      ]
    end

    def self.python_5_venv
      AVAILABLE_LIBRARY_VERSION[PYTHON_NAME][0]
    end

    def self.python_6_venv
      AVAILABLE_LIBRARY_VERSION[PYTHON_NAME][1]
    end

    def self.ruby_4_gemset
      AVAILABLE_LIBRARY_VERSION[RUBY_NAME][0]
    end

    def self.ruby_5_gemset
      AVAILABLE_LIBRARY_VERSION[RUBY_NAME][1]
    end

    def self.node_2_path
      node_path = AVAILABLE_LIBRARY_VERSION[NODE_NAME][0]
      "#{DEP_DIR_NAME}/#{NODE_NAME}/#{node_path}/node_modules"
    end

    def self.node_3_path
      node_path = AVAILABLE_LIBRARY_VERSION[NODE_NAME][1]
      "#{DEP_DIR_NAME}/#{NODE_NAME}/#{node_path}/node_modules"
    end

    def get_java_6_jars
      get_java_jars(JAVA6_NAME)
    end

    def get_java_7_jars
      get_java_jars(JAVA7_NAME)
    end

    private

    def get_java_jars(java_name)
      twilio_dependency = AVAILABLE_LIBRARY_VERSION[java_name]
      JAVA_DEPENDENCIES[java_name].push(twilio_dependency).map do |dependency|
        build_java_jar_name(dependency)
      end
    end

    def build_java_jar_name(dependency)
      "#{dependency[:name]}-#{dependency[:version]}#{dependency[:suffix]}.jar"
    end

    def build_maven_url(dependency, filename)
      group = dependency[:group].tr '.', '/'
      "http://repo.maven.apache.org/maven2/#{group}/#{dependency[:name]}/#{dependency[:version]}/#{filename}"
    end

    def install_java_dependencies(java_name)
      twilio_dependency = AVAILABLE_LIBRARY_VERSION[java_name]
      JAVA_DEPENDENCIES[java_name].push(twilio_dependency).each do |dependency|
        filename = build_java_jar_name(dependency)
        version = dependency[:version]
        install_language_version(java_name, twilio_dependency[:version]) do
          node_modules_dir = "#{DEP_DIR_NAME}/#{java_name}/#{version}"
          url = build_maven_url(dependency, filename)
          system("wget #{url} -O #{filename}")
        end
      end
    end

    def install_node_dependencies
      AVAILABLE_LIBRARY_VERSION[NODE_NAME].each do |version|
        install_language_version(NODE_NAME, version) do
          node_modules_dir = "#{DEP_DIR_NAME}/#{NODE_NAME}/#{version}"
          # npm 4 requires even an empty package.json
          FileUtils.cp("#{__dir__}/package.json", "#{node_modules_dir}/package.json")
          system("npm install -q -p #{node_modules_dir} twilio@#{version} express body-parser")
        end
      end
    end

    def install_ruby_dependencies
      AVAILABLE_LIBRARY_VERSION[RUBY_NAME].each do |version|
        system(
          "rvm gemset create #{version} &&"\
          " rvm @#{version} do gem install twilio-ruby -v #{version}"
        )
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
        system("wget https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -O #{NUGET_FILE_NAME}")
      end

      AVAILABLE_LIBRARY_VERSION[CSHARP_NAME].each do |version|
        install_language_version(CSHARP_NAME, version) do
          CSHARP_DEPENDENCIES[version].each do |dependency|
            puts dependency
            next if Dir.exist?("#{dependency[:name]}.#{dependency[:version]}")
            cmdSudoPrefix = 'sudo ' unless ENV['RUN_ENV'] == 'test'
            system(
              "#{cmdSudoPrefix}mono #{DEP_DIR_NAME}/#{NUGET_FILE_NAME} install #{dependency[:name]} -Version #{dependency[:version]}"
            )
          end
        end
      end
    end

    def install_python_dependencies
      system('sudo pip install virtualenvwrapper')

      AVAILABLE_LIBRARY_VERSION[PYTHON_NAME].each do |version|
        run_with_bash(
          'source /usr/local/bin/virtualenvwrapper.sh &&'\
          " mkvirtualenv #{version} &&"\
          " pip install twilio==#{version}"
        )
      end
    end

    def run_with_bash(command)
      system("bash -c '#{command}'")
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

Model::Dependency.install_dependencies if $PROGRAM_NAME == __FILE__
