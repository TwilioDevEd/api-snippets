<?php
// Download the library and copy into the folder containing this file.
require_once '/path/to/vendor/twilio/sdk/Services/Twilio.php';

$response = new Services_Twilio_Twiml;
$response->enqueue(array('workflowSid' => 'WW0123456789abcdef0123456789abcdef'))
    ->task("{'account_number':'12345abcdef'}");
print $response;
?>
<!-- alternatively -->

<?php
$workflowSid = "WW0123456789abcdef0123456789abcdef";

header('Content-Type: application/xml');
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n";

?>
<Response>
	<Enqueue workflowSid="<?php echo $workflowSid ?>">
		<Task>{"account_number": "12345abcdef"}</Task>
	</Enqueue>
</Response>
