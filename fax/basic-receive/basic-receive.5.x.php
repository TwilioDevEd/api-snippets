<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class FaxController extends Controller {

    public function __construct()
    {
        parent::__construct();

        // set content-type for all requests returned by this controller
        $this->set_output->set_content_type('text/xml');
    }

    // Define a handler for when the fax is initially sent
    public function sent()
    {
        $twimlResponse = new SimpleXMLElement("<Response></Response>");
        $receiveEl = $twimlResponse->addChild('Receive');
        $receiveEl->addAttribute('action', '/fax/received');

        $this->output->set_output($twimlResponse->asXML());
    }

    // Define a handler for when the fax is finished sending to us - if successful,
    // We will have a URL to the contents of the fax at this point
    public function received()
    {
        // log the URL of the PDF received in the fax
        log_message('info', $this->input->post("MediaUrl"));

        // Respond with empty 200/OK to Twilio
        $this->set_status_header(200);
        $this->output->set_output('');
    }
}
