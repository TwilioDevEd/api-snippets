<?php

// this line loads the library 
require('/path/to/twilio-php/Services/Twilio.php'); 
 
// Download the Node helper library from twilio.com/docs/php/install
// These vars are your accountSid and authToken from twilio.com/user/account
$account_sid = '{{ account_sid }}'; 
$auth_token = '[AuthToken]'; 
$client = new Services_Twilio($account_sid, $auth_token); 
 
$client->account->messages->create(array( 
    'To' => "+16518675309", 
    'MessagingServiceSid' => "MG9752274e9e519418a7406176694466fa", 
    'Body' => "Phantom Menace was clearly the best of the prequel trilogy.",
));