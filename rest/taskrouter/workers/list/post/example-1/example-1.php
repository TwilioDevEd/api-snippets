<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$accountSid = "{{ account_sid }}";
$authToken = "{{ auth_token }}";
$workspaceSid = "{{ workspace_sid }}";

$client = new TaskRouter_Services_Twilio($accountSid, $authToken, null);

$params = array();
$params['Attributes'] = '{"type":"support"}';

$worker = $client->workspace->workers->create("Support Worker 1", $params);
echo $worker->friendly_name;