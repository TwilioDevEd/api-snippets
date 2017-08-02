# Code snippets for the Twilio API documentation
[![Build Status](https://travis-ci.org/TwilioDevEd/api-snippets.svg?branch=master)](https://travis-ci.org/TwilioDevEd/api-snippets)

## Guidelines

1. Snippets should use placeholders for user information in a format that
   resembles the original value. For example:

   ```
   Account SID: ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   Call SID:    CAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   API Key:     SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
   ```

   **Note:** This is important as Twilio libraries use these values as a part
   of the URL for API requests. When testing the snippets real requests will
   be made to a fake server.

   In the case of phone numbers, the following should be used:

   ```
   Destination Phone Number: +15558675309
   From/Twilio Number: +15017250604
   ```

   For auth_token:

   ```
   Auth Token: your_auth_token
   ```

1. **Snippet file names are important**. A snippet's file extension is the only
   way to mark them for a specific language. This is important because the
   language will be visible on the docs. Also, you must mark snippets with the
   twilio-client version that is used in that particular snippet.

   For example, a java snippet that uses `twilio-java` v7.x should be named as:
   ` snippet-example-1.7.x.java`

   The same applies to the rest of languages and library versions, and this is
   the list of currently supported languages and versions:

   ```
   snippet-example-1.6.x.java
   snippet-example-1.7.x.java
   snippet-example-1.2.x.js
   snippet-example-1.3.x.js
   snippet-example-1.4.x.rb
   snippet-example-1.5.x.rb
   snippet-example-1.4.x.cs
   snippet-example-1.5.x.cs
   snippet-example-1.4.x.php
   snippet-example-1.5.x.php
   snippet-example-1.5.x.py
   snippet-example-1.6.x.py
   ```

   And the full structure should look like this:

   ```
   rest/
   |-- resource-example/
       |-- snippet-example-1/
           |-- output/
           |   |-- snippet-example-1.json
           |-- snippet-example-1.7.x.java
           |-- snippet-example-1.<sdk-version>.x.<language>
           |-- snippet-example-1.json.curl
           |-- snippet-example-1.xml.curl
           |-- meta.json
   ```

   Client version is important, as that is how the test harness knows which
   version of the client it should use for testing.

## Continuous Integration
All snippets are run in a container-based environment for each language
(see [.travis.yml](.travis.yml#L32) file), so the first check we do is for
syntax error.

There're two kind of snippets we test:
- **API/REST snippets:**
  For these cases we only check syntax error. But, these snippets also do a
  request to Twilio's endpoints, so we mock this behaviour using a
  [fake API server](https://github.com/TwilioDevEd/twilio-api-faker).

  **Note:** The test doesn't check if the http request body is well formed to
  do what the intended snippet is supposed to do, e.g.,
  if you have a snippet doing `resource.update(propA=True)`, but the expected
  result is to update `propB`, the test may go green because there's no syntax
  error. That's because some attributes are optional to update, so the request
  body may or may not has the parameters needed to update the resource
  according to the expected result.

- **Twiml snippets:**
  When running Twiml snippets, the snippets should print the `xml` result to the
  standard output, so we can capture that output and compare it with the
  expected `xml` sample. We read this `/output/sample.xml` file which is
  placed in the same folder of the snippet.

### How to mark specific folders as testable
If you want a snippet folder to be tested, there are two ways to mark it as
testable:

1. Using a `meta.json` file:
   This file is required and must live in all snippet folders, inside you
   can enable its specific folder for testing, adding `"testable": true`
   like so:

   ```json
   {
     "title": "Snippet title",
     "type": "server",
     "testable": true
   }
   ```

1. Using a `test.yml` file:
   This file is optional and can live inside any folder, it's used to specify
   a deep recursive testing for all folders inside. So, if the marked directory
   contains several snippets, all of them will be marked as testable
   recursively. You just need to add `testable: true` to the file like so:

   ```yaml
   testable: true
   ```

**Notes:**
- For testing Twiml snippets the option available is:

  ```
  meta.json -> "test_output": true
  test.yml -> test_output: true
  ```

  This will compare the output of the snippet with the `output/sample.xml` file
  inside the same directory of the snippet.

- You can mark a directory or a snippet to be not testable too.
  ```
  meta.json -> "testable": false
  test.yml -> testable: false
  ```
  This way, you can mark snippets or directories to be tested or not,
  by exception.

- For a snippet to be testable, it has to contain the basic things a program in
  that language should have. For example in Java, the code snippet should have a
  public class and a `main` method in it.

- Specific dependencies are supported for snippets. If a new dependency is
  introduced, the testing scripts should be modified to support it.

### Local Snippet Testing

The next steps describe how to run the snippets test locally in a UNIX based
operating system (examples will be provided for Debian based Linux distributions
and OSX using [Homebrew](http://brew.sh/)). **This has not been tested in a
Windows OS.**

#### Setting Up the Environment

Make sure you have the following dependencies installed on your system.

1. Install Node.js. The best option for this is to use
   [nvm](https://github.com/creationix/nvm#install-script)

   ```bash
   curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash \
   export NVM_DIR="$HOME/.nvm" \
   [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" \
   nvm install --lts
   ```

1. Install Python and PIP.

   On Linux:
   ```bash
   sudo apt-get install python-pip python2.7-dev build-essential \
   sudo pip install --upgrade pip
   ```
   On OSX:
   ```bash
   brew install python
   ```

1. Install JDK8 and Gradle. The best option for this is to use
   [sdkman](http://sdkman.io/install.html)

   ```bash
   curl -s "https://get.sdkman.io" | bash \
   source "$HOME/.sdkman/bin/sdkman-init.sh" \
   sdk install java \
   sdk install gradle
   ```

1. Install PHP 5 with CURL.

   On Linux:
   ```bash
   sudo add-apt-repository ppa:ondrej/php -y
   sudo apt-get update
   sudo apt-get install -y --force-yes php5.6
   ```

   On OSX:
   ```bash
   brew install php56
   ```

   - Install Composer.
     ```bash
     curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
     ```

1. Install Ruby and RubyGems.

   ```bash
   curl -sSL https://get.rvm.io | bash -s stable --ruby
   ```

1. Install MonoDevelop.

   On Linux (http://www.mono-project.com/docs/getting-started/install/linux/#usage):
   ```bash
   sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
   echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list \
   sudo apt-get update \
   sudo apt-get install mono-complete -y
   ```

   On OSX:
   ```bash
   brew install mono
   ```

#### Install Language Dependencies

The testing and installation scripts use ruby. Before installing language
dependencies you need to install the following gems:

```bash
gem install json colorize nokogiri
```

You can use the following command to install language dependencies, which will
download the latest version of the helper libraries for each language:

```bash
ruby tools/snippet-testing/model/dependency.rb
```

**Note:** That file specifies the latest version for every helper library for
each language, but for java the files to specify the versions are located in:
`tools/snippet-testing/language_handler/file-templates/build.<version>.gradle`
where `<version>` should be `6` or `7`.

Another option is to use the `snippet_tester.rb` file and pass the `-i` flag,
this will try to install whatever dependency is needed before running the tests:

```bash
ruby tools/snippet-testing/snippet_tester.rb -i
```

**Note:** This will also install missing dependencies before running the tests.
`sudo` will be used within the dependency installation script so you might need
to enter your password.
**DO NOT** run the whole script with `sudo` as it would install dependencies for
the wrong user.

#### Run the Tests

1. Clone and run the fake-api server in a different terminal session.

   ```bash
   git clone git@github.com:TwilioDevEd/twilio-api-faker.git \
   cd twilio-api-faker \
   sudo gradle run
   ```

1. Make your system trust the fake server's self signed certificate.

   On Linux:
   ```bash
   sudo apt-get install ca-certificates \
   sudo cp twilio-api-faker/keystore/twilio_fake.pem /usr/local/share/ca-certificates/twilio_fake.crt \
   sudo update-ca-certificates
   ```

   On OSX:
   Use the system's keychain to trust the provided certificate in the `keystore`
   directory of the fake-api repo. Go [here](https://support.apple.com/kb/PH18677?locale=en_US)
   for more information.


1. Update your hosts file with [this content](./tools/hosts)

   ```bash
   sudo cat ./tools/hosts >> /etc/hosts
   ```

   If you want to avoid this step, you can simply pass the option `-u` to the
   test runner.

   ```bash
   SNIPPET_LANGUAGE=node ruby tools/snippet-testing/snippet_tester.rb -u -d rest/calls
   ```

   **Note:** To make changes inside the `/etc/hosts` file, it will prompt you
   for your password.

   **Note:** For Mac users, this options depends on gnu `sed` command, because mac
   native `sed` has problems when using optiong `-i`, for that reason I suggest
   you to install `brew install gnu-sed` and create an alias in your `.bashrc`
   file like `alias sed=gsed`.


1. Make a copy of the `.env.example` file.

   ```bash
   cp .env.example .env
   ```

1. Set the necessary environment variables.

   Change environment variables in the `.env` file to match your configuration
   and then use the `source` command to export the variables.

   ```bash
   source .env
   ```

1. Finally, run the tests.

   ```bash
   ruby tools/snippet-testing/snippet_tester.rb
   ```

   **Note:** Remember to mark the directories you want to be tested with a
   `test.yaml` file. For more information go [here](#continuous-integration).

   You can also specify a directory to be tested (relative or absolute path).
   If a directory is specified, then the default testing behavior for that
   directory and everything it contains is `true`.

   ```bash
   ruby tools/snippet-testing/snippet_tester.rb -d rest/making-calls
   ```
