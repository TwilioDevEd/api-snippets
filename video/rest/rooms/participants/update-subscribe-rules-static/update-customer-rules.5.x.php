<?php
// Get the PHP helper library from https://twilio.com/docs/libraries/php
require_once '/path/to/vendor/autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Find your credentials at twilio.com/console
// To set up environmental variables, see http://twil.io/secure
$apiKeySid = getenv('TWILIO_API_KEY');
$apiKeySecret = getenv('TWILIO_API_KEY_SECRET');
$client = new Client($apiKeySid, $apiKeySecret);

$client->video->rooms('RMXXXX')->participants('Customer')
->subscribeRules->update(
    'rules' =>   array(
                        array("type" => "include", "all" => true),
                        array("type" => "exclude", "publisher" => "Supervisor")
                      )
);

echo 'Subscribe Rules updated successfully';
