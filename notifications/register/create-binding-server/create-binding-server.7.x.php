<?php
// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Rest/Client.php');

use Twilio\Rest\Client;

// Your Account SID and Auth Token from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$accountSid = getenv('TWILIO_ACCOUNT_SID');
$authToken = getenv('TWILIO_AUTH_TOKEN');

$serviceSid = "ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

// Initialize the client
$client = new Client($accountSid, $authToken);

// Create a binding
$binding = $client
    ->notify->services($serviceSid)
    ->bindings->create(
        'XXXXXXXXXXXXXXX', // Endpoint
        '00000001', // We recommend using a GUID or other anonymized identifier for Identity.
        'gcm', // Binding type
        'gcm_device_token', // Address
        ['tag' => ['premium', 'new user']] // Options
    );

echo $binding->sid;
