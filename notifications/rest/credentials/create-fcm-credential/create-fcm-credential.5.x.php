<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account SID and Auth Token from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$accountSid = getenv('TWILIO_ACCOUNT_SID');
$authToken = getenv('TWILIO_AUTH_TOKEN');

// Initialize the client
$client = new Client($accountSid, $authToken);

$credential = $client
    ->notify
    ->credentials
    ->create(
        "fcm",
        [
            "friendlyName" => "MyFCMCredential",
            "secret" => "fcm_secret"
        ]
    );

echo $credential->friendlyName; // => MyGCMCredential
