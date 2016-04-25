<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACda6f132a3c49700934481addd5ce1659"; 
$token = "{{ auth_token }}"; 
$client = new Services_Twilio($sid, $token);

// Loop over the list of recordings and echo a property for each one
foreach ($client->account->recordings->getIterator(0, 50, array(
        "DateCreated>" => "2009-07-06"
    )) as $recording
) {
    echo $recording->call_sid;
}