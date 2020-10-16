<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID');
$token = getenv('TWILIO_AUTH_TOKEN');
$client = new Client($sid, $token);

$allMedia = $client
    ->messages("MM800f449d0399ed014aae2bcc0cc2f2ec")
    ->media
    ->read();

// Loop over the list of media and echo a property for each one
foreach ($allMedia as $media) {
    echo $media->contentType;
}
