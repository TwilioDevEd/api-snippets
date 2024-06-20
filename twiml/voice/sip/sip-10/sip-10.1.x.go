package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}

	sip := &twiml.VoiceSip{}
	sip.SipUrl = "sip:kate@example.com"
	sip.StatusCallbackEvent = "initiated ringing answered completed"
	sip.StatusCallback = "https://myapp.com/calls/events"
	sip.StatusCallbackMethod = "POST"

	dial.InnerElements = []twiml.Element{sip}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
