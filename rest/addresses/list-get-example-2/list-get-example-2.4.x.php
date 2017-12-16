<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Services_Twilio($sid, $token);

// Loop over the list of addresses and echo a property for each one
foreach ($client->account->addresses->getIterator(0, 50, array(
	"CustomerName" => "Customer 123"
    )) as $address) {
    echo $address->friendly_name;
}
