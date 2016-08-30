<?php

// this line loads the library 
require('/path/to/twilio-php/Services/Twilio.php'); 
 
$account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'; 
$auth_token = 'your_auth_token'; 
$client = new Services_Twilio($account_sid, $auth_token); 
 
$client->account->messages->create(array( 
    'To' => "+15558675309", 
    'From' => "+15017250604", 
    'Body' => "Hey Jenny! Good luck on the bar exam!", 
    'MediaUrl' => "http://farm2.static.flickr.com/1075/1404618563_3ed9a44a3a.jpg",  
));