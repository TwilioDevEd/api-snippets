<?php

// this line loads the library
require('/path/to/twilio-php/Services/Twilio.php');
 
$account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
$auth_token = 'your_auth_token';
$client = new Services_Twilio($account_sid, $auth_token);
 
$client->account->messages->create(array(
    'To' => "+15558675309",
    'From' => "+15017250604",
    'Body' => "This is the ship that made the Kessel Run in fourteen parsecs?",
    'MediaUrl' => "https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg",
));
