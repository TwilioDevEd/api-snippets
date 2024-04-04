<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php';

use Twilio\Security\RequestValidator;

// Your auth token from twilio.com/user/account
$token = getenv("TWILIO_AUTH_TOKEN");

// The X-Twilio-Signature header - in PHP this should be
// You may be able to use $signature = $_SERVER["HTTP_X_TWILIO_SIGNATURE"];
$signature = 'Np1nax6uFoY6qpfT5l9jWwJeit0=';

// Initialize the request validator
$validator = new RequestValidator($token);

// The Twilio request URL. You may be able to retrieve this from
// You may be able to use $url = $_SERVER['SCRIPT_URI']
$url = 'https://example.com/myapp';

// Store the application/x-www-form-urlencoded parameters from Twilio's request as a variable
// In practice, this MUST include all received parameters, not a
// hardcoded list of parameters that you receive today. New parameters
// may be added without notice.
// You may be able to use $postVars = $_POST
$postVars = array(
  'CallSid' => 'CA1234567890ABCDE',
  'Caller' => '+12349013030',
  'Digits' => '1234',
  'From' => '+12349013030',
  'To' => '+18005551212'
);

// Check if the incoming signature is valid for your application URL and the incoming parameters
if ($validator->validate($signature, $url, $postVars)) {
  echo "Confirmed to have come from Twilio.";
} else {
  echo "NOT VALID. It might have been spoofed!";
}
