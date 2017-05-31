# Code snippets for the Twilio API documentation
[![Build Status](https://travis-ci.org/TwilioDevEd/api-snippets.svg?branch=master)](https://travis-ci.org/TwilioDevEd/api-snippets)

## Guidelines

1. Snippets should use placeholders for user information in a format that resembles
   the original value. For example:
   ```
   Account SID: ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   Call SID:    CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   API Key:     SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   ```

   __Note:__ This is important as Twilio libraries use these values as a part of the URL for API requests.
   When testing the snippets real requests will be made to a fake server.

   In the case of phone numbers, the following should be used:
   ```
   Destination Phone Number: +15558675309
   From/Twilio Number: +15017250604
   ```

   For auth_token:
   ```
   Auth Token: your_auth_token
   ```

1. **Snippet file names are important**. A snippet's file extension is the only way
   to mark them for a specific language. This is important because the language will
   be visible on the docs. Also, you must mark snippets with the twilio-client
   version that is used in that particular snippet.

   For example, a java snippet that uses `twilio-java` v7.x should be named as follows:

   `any_snippet_name.7.x.java`

   The same applies to the rest of languages and library versions, and this is
   the list of currently supported languages and versions:

   ```
   any_snippet_name.6.x.java
   any_snippet_name.7.x.java
   any_snippet_name.2.x.js
   any_snippet_name.3.x.js
   any_snippet_name.4.x.rb
   any_snippet_name.5.x.rb
   any_snippet_name.4.x.cs
   any_snippet_name.5.x.cs
   any_snippet_name.4.x.php
   any_snippet_name.5.x.php
   any_snippet_name.5.x.py
   any_snippet_name.6.x.py
   any_snippet_name.json.curl
   any_snippet_name.xml.curl
   ```

   Client version is important, as that is how the test harness knows which version of
   the client it should use for testing.

## Continuous Integration

This repository is configured to test that a snippet is valid. For compiled languages,
this means just compiling the snippet, and for dynamic languages, actually running
the snippet. If a snippet makes requests to the Twilio API, they will be made to a
[fake API server](https://github.com/TwilioDevEd/twilio-api-faker)
If you want a snippet to be tested, there are two ways to mark it as testable:

1. Mark a specific snippet for testing.

   You can mark a specific snippet for testing by adding a
   `"testable"` field in the `meta.json` file like this:
   ```
   {
     "title": "Snippet title",
     "type": "server",
     "testable": true
   }
   ```

1. Mark an entire directory as testable.

   You can also mark entire directories as testable. If the marked directory
   contains several snippets, all of them will be marked as testable recursively.
   To mark a directory for testing, create a `test.yml` in the root of the directory
   you want to mark as testable with a `testable` field like this:
   ```
   testable: true
   ```

__Notes:__
1. You can mark a directory or a snippet to be not testable too.
   ```
   meta.json -> "testable": false
   test.yml -> testable: false
   ```
   This way, you can mark snippets or directories to be tested or not, by exception.
1. For a snippet to be testable, it has to contain the basic things a program in
   that language should have. For example in Java, the code snippet should have a
   public class and a `main` method in it.
1. Specific dependencies are supported for snippets. If a new dependency is introduced,
   the testing scripts should be modified to support it.

### Local Snippet Testing

The current status of the snippet tests allows to test snippets only in the `rest/`, `pricing/` and `security`
directories.

The next steps describe how to run the snippets test locally in a UNIX based operating system
(examples will be provided for Debian based Linux distributions and OSX using [Homebrew](http://brew.sh/)).
This has not been tested in a Windows OS.

You can take a look at the [.travis file](blob/master/.travis.yml) on this repository
to find out what dependencies and tasks are required in order to run the snippet tests.
But, a detailed list of steps will be provided next.

#### Set Up the Environment

Make sure you have the following dependencies installed on your system.

1. Install Node.js.

   On Linux:
   ```bash
   $ curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
   $ sudo apt-get install -y nodejs
   $ sudo npm install -g n
   $ sudo n lts
   ```
   On OSX:
   ```
   $ brew install node
   ```

1. Install Python and PIP.

   On Linux:
   ```bash
   $ sudo apt-get install python-pip python2.7-dev build-essential
   $ sudo pip install --upgrade pip
   ```
   On OSX:
   ```bash
   $ brew install python
   ```

1. Install JDK8 and Gradle.

   On Linux:
   ```bash
   $ sudo add-apt-repository ppa:webupd8team/java
   $ sudo add-apt-repository ppa:cwchien/gradle
   $ sudo apt-get update
   $ sudo apt-get install oracle-java8-installer
   $ sudo apt-get install gradle
   ```
   On OSX:

   Download OSX JDK8 installer from
   http://www.oracle.com/technetwork/java/javase/downloads/index.html
   ```bash
   $ brew install gradle
   ```

1. Install PHP 5 with CURL.

   On Linux:
   ```bash
   $ sudo apt-get install curl php5-cli php5-curl curl
   ```
   On OSX:
   ```bash
   $ brew install homebrew/php/php55
   ```

1. Install Composer.

   ```bash
   $ curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
   ```

1. Install Ruby and RubyGems.

   ```bash
   $ curl -sSL https://get.rvm.io | bash -s stable --ruby
   ```

1. Install MonoDevelop.

   On Linux (http://www.mono-project.com/docs/getting-started/install/linux/#usage):
   ```bash
   $ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
   $ echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
   $ sudo apt-get update
   $ sudo apt-get install mono-complete
   ```
   On OSX:
   ```bash
   $ brew install mono
   ```

#### Install Language Dependencies

The testing and installation scripts use ruby. Before installing language
dependencies you need to install the following gems:

```bash
$ bundle install
```

You can use the following command to install dependencies in your system:

```bash
$ ruby tools/snippet-testing/model/dependency.rb
```

This will download all the necessary dependencies for the snippets to run.
You can also pass the `-i` flag to the testing command you'll use in the next step,
like this:

```bash
$ ruby tools/snippet-testing/snippet_tester.rb -i
```

__Note:__ This will also install missing dependencies before running the tests. `sudo` will
be used within the dependency installation script so you might need to enter your
password.
**Do not** run the whole script with `sudo` as it would install dependencies for
the wrong user.

#### Run the Tests

1. Clone and run the fake-api server in a different terminal session.

   ```bash
   $ git clone git@github.com:TwilioDevEd/twilio-api-faker.git
   $ cd twilio-api-faker
   $ sudo gradle run
   ```

1. Make your system trust the fake server's self signed certificate.

   On Linux:
   ```bash
   $ sudo apt-get install ca-certificates
   $ sudo cp twilio-api-faker/keystore/twilio_fake.pem /usr/local/share/ca-certificates/twilio_fake.crt
   $ sudo update-ca-certificates
   ```
   On OSX:

   Use the system's keychain to trust the provided certificate in the `keystore`
   directory of the fake-api repo. Go [here](https://support.apple.com/kb/PH18677?locale=en_US)
   for more information.

1. Change your hosts file.

   Edit your `/etc/hosts` file. Add the following entries:
   ```
   127.0.0.1 notifications.twilio.com
   127.0.0.1 notify.twilio.com
   127.0.0.1 taskrouter.twilio.com
   127.0.0.1 api.twilio.com
   127.0.0.1 lookups.twilio.com
   127.0.0.1 pricing.twilio.com
   127.0.0.1 monitor.twilio.com
   127.0.0.1 ip-messaging.twilio.com
   ```

1. Make a copy of the `.env.example` file.

   ```bash
   $ cp .env.example .env
   ```

1. Set the necessary environment variables.

   Change environment variables in the `.env` file to match your configuration
   and then use the `source` command to export the variables.

   ```bash
   $ source .env
   ```

1. Finally, run the tests.

   ```bash
   $ ruby tools/snippet-testing/snippet_tester.rb
   ```

   __Note:__ Remember to mark the directories you want to be tested with a `test.yaml`
   file. For more information go [here](#continuous-integration).

   You can also specify a directory to be tested (relative or absolute path). If a directory is
   specified, then the default testing behavior for that directory and everything
   it contains is `true`.

   ```bash
   $ ruby tools/snippet-testing/snippet_tester.rb -d rest/making-calls
   ```
