<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php';

use Twilio\Rest\Client;

// Your Account SID from www.twilio.com/console
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
// Your Auth Token from www.twilio.com/console
$token = "your_auth_token";

$client = new Client($sid, $token);

$client->preview->wireless->commands->create(
    array(
        'device' => "524116518656369",
        'command' => "wakeup",
        'callbackUrl' => "https://devicemanager.mycompany.com/devices/524116518656369/commands"
    )
);
