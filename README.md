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
   In the case of phone numbers, any example phone number can be used:
   ```
   Phone Number: +5551234567
   ```

   For placeholders that do not have a specific format, the mustache style should be used for placeholders. For example:
   ```
   Auth Token: {{ auth_token }}
   ```

   __Note:__ This is important as Twilio libraries use these values as a part of the URL for API requests.
   When testing the snippets real requests will be made to a fake server.
