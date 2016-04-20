<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "{{ account_sid }}";
$authToken = "{{ auth_token }}";
$workspaceSid = "{{ workspace_sid }}";
$taskQueueSid = "{{ taskqueue_sid }}";

$client = new TaskRouter_Services_Twilio($accountSid, $authToken, $workspaceSid);

$taskQueue = $client->workspace->task_queues->get($taskQueueSid);
$taskQueue->update(
	array(
		'TargetWorkers' => 'languages HAS "english"'
	)
);
