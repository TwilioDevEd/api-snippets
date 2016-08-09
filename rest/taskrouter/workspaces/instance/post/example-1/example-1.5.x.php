<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new Client($accountSid, $authToken);

$workspace = $client->taskrouter
    ->workspaces($workspaceSid)
    ->update(
        array(
            'friendlyName' => 'NewFriendlyName',
            'eventCallbackUrl' => 'http://requestb.in/vh9reovh'
        )
    );

echo $workspace->friendlyName;
