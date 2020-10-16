<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;
use Twilio\Exceptions\RestException;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');

$client = new Client($sid, $token);

try {
  $number = $client->lookups
      ->phoneNumbers("+15108675310")
      ->fetch(
          array("type" => "carrier")
      );

  echo $number->carrier["type"] . "\r\n";
  echo $number->carrier["name"];
} catch (RestException $e) {
    if ($e->getStatusCode() == "404") {
        echo "No carrier information.\n";
    } else {
        throw $e;
    }
}
