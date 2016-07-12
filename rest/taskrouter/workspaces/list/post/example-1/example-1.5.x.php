<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";

$client = new Client($accountSid, $authToken);

$workspaces = $client->taskrouter->workspaces();

$params = [
    'eventCallbackUrl' => 'http://requestb.in/vh9reovh',
    'template' => 'FIFO'
];

$workspace = $workspaces->create("NewWorkspace", $params);

echo $workspace->friendlyName;
