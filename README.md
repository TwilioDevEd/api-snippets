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
(see [.travis.yml](.travis.yml#25) file), so the first check we do is for
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

### Pre-commit hook  
Use of pre-commit hooks is recommended. Only the snippets which have been modified will be
linted.

To install the pre-commit hook run the following:

```bash
make install
```

If you want to commit snippets that are a work in progress you can bypass the pre-commit
hook as follows:

```bash
git commit --no-verify
```

### Local Snippet Testing

1. Install [Docker](https://docs.docker.com/engine/installation/).

1. Run the tests.

   ```bash
   ./test
   ```

   **Note:** Remember to mark the directories you want to be tested with a
   `test.yaml` file. For more information go [here](#continuous-integration).

   You can also specify a directory to be tested (relative or absolute path).
   If a directory is specified, then the default testing behavior for that
   directory and everything it contains is `true`.

   Run tests in specific directory:
   ```bash
   ./test -d rest/making-calls
   ```

   Alternatively, you can filter by directory and/or language:

   ```bash
   ./test -d rest/making-calls -l ruby
   ```
   Available languages are node, ruby, java6, java7, python, php, csharp and curl. These languages can be combined as follows:

   ```bash
   ./test -d rest/making-calls -l java6:python
   ```
