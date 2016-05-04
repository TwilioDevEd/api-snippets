<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{ account_sid }}"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

// Loop over the list of records and echo a property for each one
foreach ($client->account->usage_records->today->getIterator(0, 50, array(
        "Category" => "calls"
    )) as $record
) {
    echo $record->count;
}
