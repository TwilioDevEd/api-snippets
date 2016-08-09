<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";

$client = new Client($accountSid, $authToken);

$workspace = $client->taskrouter->workspaces
    ->create(
        "NewWorkspace",
        array(
            'eventCallbackUrl' => 'http://requestb.in/vh9reovh',
            'template' => 'FIFO'
        )
    );

echo $workspace->friendlyName;
