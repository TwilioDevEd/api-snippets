<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{ account_sid }}"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

$summary = $client->calls->feedback_summary->create(array(
	"StartDate" => "2014-06-01",
	"EndDate" => "2014-06-30",
	"IncludeSubaccounts" => "true",
	"StatusCallback" => "http://www.example.com/feedback"
));

echo $summary->status;
