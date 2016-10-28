<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$recordings = $client->recordings->read(
    array("dateCreated" => "2016-10-18")
);
// Loop over the list of recordings and echo a property for each one
foreach ($recordings as $recording) {
    echo $recording->callSid;
}
