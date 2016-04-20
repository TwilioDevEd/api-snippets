<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "{{ account_sid }}";
$authToken = "{{ auth_token }}";
$workspaceSid = "{{ workspace_sid }}";
$workerSid = "{{ worker_sid }}";

$capability = new Services_Twilio_TaskRouter_Worker_Capability($accountSid, $authToken, $workspaceSid, $workerSid);
$capability->allowActivityUpdates();
$capability->allowReservationUpdates();
$token = $capability->generateToken();

// By default, tokens are good for one hour.
// Override this default timeout by specifiying a new value (in seconds).
// For example, to generate a token good for 8 hours:

$token = $capability->generateToken(28800);  // 60 * 60 * 8