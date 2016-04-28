<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once('/path/to/twilio-php/Services/Twilio.php'); // Loads the library

// Your Account Sid and Auth Token from twilio.com/user/account
$sid = "ACda6f132a3c49700934481addd5ce1659";
$token = "{{ auth_token }}";
$client = new Monitor_Services_Twilio($sid, $token);

// Loop over the list of alerts and echo a property for each one
foreach ($client->alerts as $alert) {
    echo $alert->alert_text;
}