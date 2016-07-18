<?php
// Download the **Next-Gen** twilio-php library from:
// twilio.com/docs/libraries/php#installation-nextgen
// Include dependencies from Composer's autoload (including Twilio library)
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account SID from www.twilio.com/console
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
// Your Auth Token from www.twilio.com/console
$token = "your_auth_token";

// Initialize Twilio Rest Client
$client = new Client($sid, $token);

// List all Rate Plans
$plans = $client->preview->wireless->ratePlans->read();

foreach ($plans as $plan) {
    echo $plan->friendlyName, PHP_EOL;
    echo $plan->alias, PHP_EOL;
}
