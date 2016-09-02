<?php

// this line loads the library 
require('/path/to/twilio-php/Services/Twilio.php'); 
 
$account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
$auth_token = 'your_auth_token'; 
$client = new Services_Twilio($account_sid, $auth_token); 
 
// TODO: Confirm passing ProvideFeedback works
$client->account->messages->create(array( 
    'To' => "+15558675309", 
    'From' => "+15017250604", 
    'Body' => "Open to confirm: http://yourserver.com/confirm?id=1234567890",
    'ProvideFeedback' => $true
));