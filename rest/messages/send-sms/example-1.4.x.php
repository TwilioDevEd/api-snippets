<?php

// this line loads the library 
require('/path/to/twilio-php/Services/Twilio.php'); 
 
$account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
$auth_token = '[AuthToken]'; 
$client = new Services_Twilio($account_sid, $auth_token); 
 
$client->account->messages->create(array( 
    'To' => "+16518675309", 
    'From' => "+14158141829", 
    'Body' => "Hey Jenny! Good luck on the bar exam!", 
));