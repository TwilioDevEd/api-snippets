<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$workflowSid = "WWXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new Client($accountSid, $authToken);

$statistics = $client->taskrouter
    ->workspaces($workspaceSid)
    ->workflows($workflowSid)
    ->realTimeStatistics()
    ->fetch();

echo $statistics->tasksByStatus["pending"];
echo $statistics->tasksByStatus["assigned"];
