# Code snippets for the Twilio API documentation
[![Build Status](https://travis-ci.org/TwilioDevEd/api-snippets.svg?branch=master)](https://travis-ci.org/TwilioDevEd/api-snippets)

## Guidelines

1. Snippets should use placeholders for user information in a [mustache](https://mustache.github.io/mustache.5.html)
   like format. These are the placeholders you should use for snippets:

   * {{ account_sid }}
   * {{ auth_token }}
   * {{ subaccount_auth_token }}
   * {{ workspace_sid }}
   * {{ activity_sid }}
   * {{ worker_sid }}
   * {{ taskqueue_sid }}
   * {{ task_sid }}
   * {{ reservation_sid }}
   * {{ workflow_sid }}
   * {{ rate_plan_sid }}

   For phone numbers, any example phone number can be used:
   ```
   Phone Number: +5551234567
   ```

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
   To mark a directory for testing, create a `test.yaml` in the root of the directory
   you want to mark as testable with a `testable` field like this:
   ```
   testable: true
   ```

__Notes:__
1. You can mark a directory or a snippet to be not testable too.
   ```
   meta.json -> "testable": false
   test.yaml -> testable: false
   ```
   This way, you can mark snippets or directories to be tested or not, by exception.
1. For a snippet to be testable, it has to contain the basic things a program in
   that language should have. For example in Java, the code snippet should have a
   public class and a `main` method in it.
1. Specific dependencies are supported for snippets. If a new dependency is introduced,
   the testing scripts should be modified to support it.
