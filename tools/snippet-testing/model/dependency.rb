require 'fileutils'
require 'github_api'

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
      RUBY_NAME   => ['4.13.0', '5.0.0.rc19'],
      NODE_NAME   => ['2.11.0', '3.0.0']
    }.freeze

    CSHARP_DEPENDENCIES = {}

    REPO_TAGS_CACHE = {}

    def initialize
      update_library_versions
    end

    def install_dependencies
      new.install_dependencies
    end

    def get_tags(repo_name)
      tag_names = REPO_TAGS_CACHE[repo_name]

      unless tag_names
        github = Github.new basic_auth: 'joliveros:Chuy081805'
        tags = github.repos.tags 'twilio', repo_name, auto_pagination: true

        tag_names = tags.map(&:name)

        REPO_TAGS_CACHE[repo_name] = tag_names
      end

      tag_names
    end

    def get_latest(repo_name)
      tags = get_tags(repo_name)
      tags = tags.select { |tag| tag[/alpha1$|alpha\-1$/] }

      if tags.empty?
        tags = get_tags(repo_name)
        tags = tags.select { |tag| tag[/rc[0-9]+$/] }

        padding = 4
        tags.sort { |a, b|
          a, b = [a, b].map{ |s| s.gsub(/\d+/){|m| '0'*(padding - m.size) + m } }
          a <=> b
        }
      else
        tags = tags.sort
      end

      tags.last
    end

    def update_latest_version
      AVAILABLE_LIBRARY_VERSION.keys.each do |language|
        AVAILABLE_LIBRARY_VERSION[language][1] = get_latest("twilio-#{language}")
      end
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
      puts CSHARP_DEPENDENCIES
    end

    def get_csharp_v4
      AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][0]
    end

    def get_csharp_v5
      AVAILABLE_LIBRARY_VERSION[CSHARP_NAME][1]
    end

    def install_dependencies
      update_library_versions

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
        puts version
        install_language_version(CSHARP_NAME, version) do
          CSHARP_DEPENDENCIES[version].each do |dependency|
            next if Dir.exist?("#{dependency[:name]}.#{dependency[:version]}")

            sudoCmdPrefix = 'sudo'

            if ENV['RUN_ENV']  == 'test'
              sudoCmdPrefix = ''
            end

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
  Model::Dependency.install_dependencies
end
