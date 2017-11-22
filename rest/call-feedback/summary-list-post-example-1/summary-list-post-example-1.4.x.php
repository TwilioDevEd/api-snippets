<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Services_Twilio($sid, $token);

$summary = $client->account->calls->feedback_summary->create(
    array(
      	"StartDate" => "2014-06-01",
      	"EndDate" => "2014-06-30",
      	"IncludeSubaccounts" => "true",
      	"StatusCallback" => "http://www.example.com/feedback"
    )
);

echo $summary->status;
