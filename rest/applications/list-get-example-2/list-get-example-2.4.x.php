<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"; 
$token = "your_auth_token"; 
$client = new Services_Twilio($sid, $token);

// Loop over the list of apps and echo a property for each one
foreach ($client->account->applications->getIterator(0, 50, array(
        "FriendlyName" => "MyApp"
    )) as $app
) {
    echo $app->voice_url;
}
