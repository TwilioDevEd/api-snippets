<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "{{ account_sid }}";
$token = "{{ auth_token }}";
$client = new Pricing_Services_Twilio($sid, $token);

$country = $client->phoneNumberCountries->get("US");

foreach ($country->phone_number_prices as $p) {
    echo $p->number_type . " " . $p->current_price . "\n";
}
