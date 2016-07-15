<?php
// Download the **Next-Gen** twilio-php library from:
// twilio.com/docs/libraries/php#installation-nextgen
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account SID from www.twilio.com/console
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
// Your Auth Token from www.twilio.com/console
$token = "your_auth_token";

// Initialize Twilio Rest Client
$client = new Client($sid, $token);

$device = $client->preview->wireless
    ->devices->create(
    "{{ rate_plan_sid }}",
    array(
        'alias' => "996224413905003",
        'friendlyName' => "Charlie's SmartMeter"
    )
);

echo $device->friendlyName;
