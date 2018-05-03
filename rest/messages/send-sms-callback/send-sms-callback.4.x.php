<?php

// this line loads the library 
require('/path/to/twilio-php/Services/Twilio.php'); 
 
$account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
$auth_token = 'your_auth_token'; 
$client = new Services_Twilio($account_sid, $auth_token); 
 
$client->account->messages->create(array( 
    'To' => "+15558675310", 
    'From' => "+15017122661", 
    'Body' => "McAvoy or Stewart? These timelines can get so confusing.",
    'StatusCallback' => "http://requestb.in/1234abcd"
));
