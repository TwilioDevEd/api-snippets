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

$usage = $client->preview->wireless
    ->devices("524116518656369")->usage()->fetch(
        array(
            'start' => "2016-05-01",
            'end' => "2016-05-01"
        )
    );

echo $usage->period['start'], PHP_EOL;
echo $usage->period['end'], PHP_EOL;
echo $usage->dataCosts['total'], PHP_EOL;
