<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$authToken = "your_auth_token";
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$taskSid = "WTXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$client = new Client($accountSid, $authToken);

$task = $client->taskrouter->workspaces()
    ->getContext($workspaceSid)
    ->tasks($taskSid);

// update a task's attributes
$task->update(
    array('attributes' => '{"type":"support"}')
);

// cancel a task
$task->update(
    array(
        'assignmentStatus' => 'canceled',
        'reason' => 'waiting too long'
    )
);
