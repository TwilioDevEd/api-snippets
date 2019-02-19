<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account SID and Auth Token from https://www.twilio.com/console
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$apnCredentialSid = "CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$fcmCredentialSid = "CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";

$serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

// Initialize the client
$client = new Client($accountSid, $authToken);

// Create a service
$service = $client
    ->notify
    ->services
    ->create(["friendlyName" => "My Awesome Service",
        "apnCredentialSid" => $apnCredentialSid,
        "fcmCredentialSid" => $fcmCredentialSid]);

echo $service->friendlyName; // => My Awesome Service
