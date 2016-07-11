<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$applications = $client->account->applications->read(
    array("friendlyName" => "MyApp"),
    50
);
// Loop over the list of apps and echo a property for each one
foreach ($applications as $app) {
    echo $app->voiceUrl;
}
