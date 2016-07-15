<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new Client($accountSid, $authToken);

$statistics = $client->taskrouter->workspaces()
    ->getContext($workspaceSid)
    ->statistics()
    ->fetch(
        array('minutes' => 60)
    );

echo $statistics->cumulative["avg_task_acceptance_time"];
echo $statistics->realtime["tasks_by_status"]["pending"];
echo $statistics->realtime["tasks_by_status"]["assigned"];
