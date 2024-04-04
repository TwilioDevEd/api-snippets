<?php
// Download the library and copy into the folder containing this file.
require_once '/path/to/vendor/autoload.php'; // Loads the library

use Twilio\TwiML\VoiceResponse;

$response = new VoiceResponse();
$response->enqueue(null, ['workflowSid' => 'WW0123456789abcdef0123456789abcdef'])
    ->task(
        "{'account_number':'12345abcdef'}",
        ['priority' => 5, 'timeout' => 200]
    );

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
        <Task priority="5" , timeout="200">{"account_number": "12345abcdef"}</Task>
    </Enqueue>
</Response>
