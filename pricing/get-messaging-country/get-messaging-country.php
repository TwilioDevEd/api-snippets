<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "AC3094732a3c49700934481addd5ce1659";
$token = "{{ auth_token }}";
$client = new Pricing_Services_Twilio($sid, $token);

$country = $client->messagingCountries->get("EE");

foreach ($country->inbound_sms_prices as $p) {
    echo $p->number_type . " " . $p->current_price . "\n";
}
