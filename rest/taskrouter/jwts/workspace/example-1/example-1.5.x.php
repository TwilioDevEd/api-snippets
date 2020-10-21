<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Jwt\TaskRouter\WorkspaceCapability;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$accountSid = getenv('TWILIO_ACCOUNT_SID');
$authToken = getenv('TWILIO_AUTH_TOKEN');
$workspaceSid = "WSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";

$capability = new WorkspaceCapability($accountSid, $authToken, $workspaceSid);
$capability->allowFetchSubresources();
$capability->allowUpdatesSubresources();
$capability->allowDeleteSubresources();
$token = $capability->generateToken();
// By default, tokens are good for one hour.
// Override this default timeout by specifiying a new value (in seconds).
// For example, to generate a token good for 8 hours:
$workerToken = $capability->generateToken(28800);  // 60 * 60 * 8
