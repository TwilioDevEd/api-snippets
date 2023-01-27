<?php
require_once './vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// To set up environmental variables, see http://twil.io/secure
$sid = getenv('TWILIO_ACCOUNT_SID'); // Your Account Sid from twilio.com/user/account
$api_key = getenv('TWILIO_API_KEY'); // You can generate this from www.twilio.com/console/runtime/api-keys/create
$api_secret = getenv('TWILIO_API_KEY_SECRET'); // You can generate this from www.twilio.com/console/runtime/api-keys/create

// DANGER! This is insecure. See http://twil.io/secure
$client = new Client($api_key, $api_secret, $sid);

// Proof request to check credentials are working.
// Retrieving your account information
$accounts = $client->api->v2010->accounts
                               ->read();

foreach ($accounts as $record) {
    print($record->sid);
}
?>
