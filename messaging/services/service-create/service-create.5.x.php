<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\Rest\Client;

$account_sid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
$auth_token = 'your_auth_token'
$twilio = new Twilio($account_sid, $auth_token);

$service = $twilio->messaging->v1->services->create(
                                                                                "My First Service",
                                                                                array(
                                                                                    'statusCallback' => "http://requestb.in/1234abcd"
                                                                                )
                                                                            );