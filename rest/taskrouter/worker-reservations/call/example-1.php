<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "{{ account_sid }}";
$authToken = "{{ auth_token }}";
$workspaceSid = "{{ workspace_sid }}";
$workerSid = "{{ worker_sid }}";
$reservationSid = "{{ reservation_sid }}";

$client = new TaskRouter_Services_Twilio($accountSid, $authToken, $workspaceSid);

// call using a reservation
$reservation = $client->workspace->workers->get($workerSid)->reservations($reservationSid);
$reservation->update(
	array(
		'Instruction' => 'call',
		'CallFrom' => '+15558675309',
		'CallUrl' => 'http://example.com/agent_answer',
		'CallStatusCallbackUrl' => 'http://example.com/agent_answer_status_callback',
		'CallAccept' => 'true'
	)
);
