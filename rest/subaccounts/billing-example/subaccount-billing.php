<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Account Sid and Auth token for your new subaccount
$sa_sid = "{{ subaccount_sid }}"; 
$sa_token = "{{ subaccount_auth_token }}";  
$sa_client = new Services_Twilio($sa_sid, $sa_token);
$subaccount = $sa_client->account;

// Place to store the billable usage
$time_to_bill = 0;

// 30 days ago
$date = strtotime('-1 month');

// Get all calls for the last 30 days
foreach ($sa_client->calls->getIterator(0, 1000, array(
    "StartTime" => "{$date->format('Y-m-d')}"
    )) as $call
) {
  # Get time of call in minutes
  $time_to_bill += ceil((float) $call->duration);
}

echo "User {{$user->username}} used {$time_to_bill} minutes.";