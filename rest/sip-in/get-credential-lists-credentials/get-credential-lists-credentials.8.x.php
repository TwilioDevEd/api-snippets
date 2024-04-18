<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');
$client = new Client($sid, $token);

$credentials = $client->sip
    ->credentialLists("CL32a3c49700934481addd5ce1659f04d2")
    ->credentials
    ->read();

// Loop over the list of credentials and echo a property for each one
foreach ($credentials as $credential) {
    echo $credential->username;
}
