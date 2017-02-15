<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account SID and Auth Token from https://www.twilio.com/console
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";

// Initialize the client
$client = new Client($accountSid, $authToken);

// List all services
$services = $client->notify->services->read();

foreach ($services as $service) {
    echo $service->friendlyName . PHP_EOL;
}
