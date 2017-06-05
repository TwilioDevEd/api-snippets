require 'fileutils'
require 'unirest'
require 'version_sorter'

module Model
  class Dependency
    DEP_DIR_NAME    = "#{Dir.pwd}/tools/dependencies".freeze
    CSHARP_NAME     = 'csharp'.freeze
    NUGET_FILE_NAME = 'NuGet.exe'.freeze
    PHP_NAME        = 'php'.freeze
    PYTHON_NAME     = 'python'.freeze
    RUBY_NAME       = 'ruby'.freeze
    NODE_NAME       = 'node'.freeze

    AVAILABLE_LIBRARY_VERSION = {
      CSHARP_NAME => ['4.7.2', '5.x'],
      PHP_NAME    => ['4.10', '5.9.0'],
      PYTHON_NAME => ['5.6.0', '6.2.0'],
      RUBY_NAME   => ['4.13.0', '5.0.0.rc20'],
      NODE_NAME   => ['2.11.0', '3.0.0-alpha-1']
    }.freeze

    CSHARP_DEPENDENCIES = {}

    def initialize
      update_library_versions
    end

    def latest_version(versions)
      versions = VersionSorter.sort(versions)
      rc_or_alpha = /alpha1$|alpha\-1$|[0-9]{1,}a1$|rc[0-9]+$/
      last_is_unstable = versions[-1] =~ rc_or_alpha

      if versions[-2] =~ rc_or_alpha && !last_is_unstable
        versions[-2]
      else
        versions[-1]
      end
    end

    def csharp_latest
      response = Unirest.get 'https://api.nuget.org/v3/registration1/twilio/index.json'
      versions = response.body['items'].map { |version_grp| version_grp['upper'] }
      latest_version(versions)
    end

    def php_latest
      response = Unirest.get 'https://packagist.org/p/twilio/sdk.json'
      package_info = response.body['packages']['twilio/sdk']
      latest_version(package_info.keys)
    end

    def python_latest
      response = Unirest.get 'https://pypi.python.org/pypi/twilio/json'
      package_info = response.body['releases']
      latest_version(package_info.keys)
    end

    def ruby_latest
      response = Unirest.get 'https://rubygems.org/api/v1/versions/twilio-ruby.json'
      versions = response.body.map { |version_info| version_info['number'] }
      latest_version(versions)
    end

    def node_latest
      response = Unirest.get 'http://registry.npmjs.org/-/package/twilio/dist-tags'
      response.body['alpha']
    end

    def update_latest_version
      AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][1] = csharp_latest
      AVAILABLE_LIBRARY_VERSION[PHP_NAME][1] = php_latest
      AVAILABLE_LIBRARY_VERSION[PYTHON_NAME][1] = python_latest
      AVAILABLE_LIBRARY_VERSION[RUBY_NAME][1] = ruby_latest
      AVAILABLE_LIBRARY_VERSION[NODE_NAME][1] = node_latest

      puts AVAILABLE_LIBRARY_VERSION
    end

    def update_library_versions
      update_latest_version

      CSHARP_DEPENDENCIES[get_csharp_v4] = [
        { name: 'Twilio', version: get_csharp_v4 },
        { name: 'Twilio.Pricing', version: '1.1.0' },
        { name: 'Twilio.IpMessaging', version: '1.2.0' },
        { name: 'Twilio.TaskRouter', version: '2.3.0' },
        { name: 'Twilio.Auth', version: '1.4.0' }
      ]

      CSHARP_DEPENDENCIES[get_csharp_v5] = [
        { name: 'Twilio', version: get_csharp_v5 },
        { name: 'JWT', version: '1.3.4' }
      ]
    end

    def get_csharp_v4
      AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][0]
    end

    def get_csharp_v5
      AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][1]
    end

    def install_dependencies
      dependencies = {
        csharp: -> { install_csharp_dependencies },
        php:    -> { install_php_dependencies },
        ruby:   -> { install_ruby_dependencies },
        node:   -> { install_node_dependencies },
        python: -> { install_python_dependencies },
        java6:  -> { puts 'nothing else to install' },
        java7:  -> { puts 'nothing else to install' },
        curl:   -> { puts 'nothing else to install' }
      }

      FileUtils.mkdir_p(DEP_DIR_NAME)

      Dir.chdir(DEP_DIR_NAME) do
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

    def php_4_path
      php_4_path = AVAILABLE_LIBRARY_VERSION[PHP_NAME][0]
      "#{DEP_DIR_NAME}/#{PHP_NAME}/#{php_4_path}"
    end

    def php_5_path
      php_5_path = AVAILABLE_LIBRARY_VERSION[PHP_NAME][1]
      "#{DEP_DIR_NAME}/#{PHP_NAME}/#{php_5_path}"
    end

    def csharp_4_path
      csharp_path = AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][0]
      "#{DEP_DIR_NAME}/#{CSHARP_NAME}/#{csharp_path}"
    end

    def csharp_5_path
      csharp_path = AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][1]
      "#{DEP_DIR_NAME}/#{CSHARP_NAME}/#{csharp_path}"
    end

    def csharp_4_dependencies
      [
        "Twilio.#{get_csharp_v4}/lib/3.5/Twilio.Api.dll",
        'Twilio.Pricing.1.1.0/lib/3.5/Twilio.Pricing.dll',
        'Twilio.IpMessaging.1.2.0/lib/3.5/Twilio.IpMessaging.dll',
        'Twilio.TaskRouter.2.3.0/lib/3.5/Twilio.TaskRouter.dll',
        'Twilio.Auth.1.4.0/lib/3.5/Twilio.Auth.dll',
        'JWT.1.1/lib/3.5/JWT.dll',
        'RestSharp.105.2.2/lib/net35/RestSharp.dll',
        'Newtonsoft.Json.3.5.8/lib/35/Newtonsoft.Json.dll'
      ]
    end

    def csharp_5_dependencies
      [
        "Twilio.#{get_csharp_v5}/lib/net35/Twilio.dll",
        'JWT.1.3.4/lib/3.5/JWT.dll',
        'Newtonsoft.Json.9.0.1/lib/net35/Newtonsoft.Json.dll'
      ]
    end

    def python_5_venv
      AVAILABLE_LIBRARY_VERSION[PYTHON_NAME][0]
    end

    def python_6_venv
      AVAILABLE_LIBRARY_VERSION[PYTHON_NAME][1]
    end

    def ruby_4_gemset
      AVAILABLE_LIBRARY_VERSION[RUBY_NAME][0]
    end

    def ruby_5_gemset
      AVAILABLE_LIBRARY_VERSION[RUBY_NAME][1]
    end

    def node_2_path
      node_path = AVAILABLE_LIBRARY_VERSION[NODE_NAME][0]
      "#{DEP_DIR_NAME}/#{NODE_NAME}/#{node_path}/node_modules"
    end

    def node_3_path
      node_path = AVAILABLE_LIBRARY_VERSION[NODE_NAME][1]
      "#{DEP_DIR_NAME}/#{NODE_NAME}/#{node_path}/node_modules"
    end

    private

    def install_node_dependencies
      AVAILABLE_LIBRARY_VERSION[NODE_NAME].each do |version|
        install_language_version(NODE_NAME, version) do
          unless Dir.exist?('node_modules')
            system("npm install --quiet twilio@#{version} express body-parser")
          end
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
            next if Dir.exist?("#{dependency[:name]}.#{dependency[:version]}")

            sudoCmdPrefix = 'sudo' unless ENV['RUN_ENV'] == 'test'

            system(
              "#{sudoCmdPrefix} mono #{DEP_DIR_NAME}/#{NUGET_FILE_NAME} install #{dependency[:name]} -Version #{dependency[:version]}"
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

if __FILE__ == $0
  dependency = Model::Dependency.new
  dependency.install_dependencies
end
