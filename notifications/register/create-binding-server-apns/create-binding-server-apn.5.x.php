<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Rest/Client.php');

use Twilio\Rest\Client;

// Your Account SID and Auth Token from https://www.twilio.com/console
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";

$serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

// Initialize the client
$client = new Client($accountSid, $authToken);

// Create a binding
$binding = $client
    ->notify->services($serviceSid)
    ->bindings->create(
        '00000001', // We recommend using a GUID or other anonymized identifier for Identity.
        'apn', // Binding type
        'apn_device_token', // Address
        ['endpoint'=>'endpoint_id', 'tag' => ['preferred device', 'new user']] // Options
    );

echo $binding->sid;
