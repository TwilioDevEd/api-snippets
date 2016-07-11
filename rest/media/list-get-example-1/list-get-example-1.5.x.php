<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library
use \Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
$token = "your_auth_token";
$client = new Client($sid, $token);

$allMedia = $client->account
    ->messages("MM800f449d0399ed014aae2bcc0cc2f2ec")
    ->media
    ->read();

// Loop over the list of medias and echo a property for each one
foreach ($allMedia as $media) {
    echo $media->contentType;
}
