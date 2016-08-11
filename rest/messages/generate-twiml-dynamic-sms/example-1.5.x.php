<?php
// Get the PHP helper library from twilio.com/docs/php/install

// this line loads the library 
require('vendor/autoload.php'); 
use Twilio\Twiml;

$response = new Twiml;
$body = $_REQUEST['Body'];

if( $body == 'hello' ){
    $response->message('Hi!');
}else if( $body == 'bye' ){
    $response->message('Goodbye');
}
print $response;