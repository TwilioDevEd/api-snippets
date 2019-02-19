<?php
// Download the library and copy into the folder containing this file.
require('twilio-php/Services/Twilio.php');

$response = new Services_Twilio_Twiml;
$response->enqueue(array(workflowSid => 'WW0123456789abcdef0123456789abcdef'));
print $response;
?>

<!-- alternatively -->

<?php
$workflowSid = "WW0123456789abcdef0123456789abcdef";

header('Content-Type: application/xml');
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";

?>
<Response>
	<Enqueue workflowSid="<?php echo $workflowSid ?>"/>
</Response>