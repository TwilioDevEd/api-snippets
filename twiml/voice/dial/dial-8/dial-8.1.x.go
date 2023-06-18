package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}
	dial.ReferUrl = "https://example.com/handler"

	sip := &twiml.VoiceSip{}
	sip.SipUrl = "sip:AgentA@xyz.sip.us1.twilio.com?User-to-User=123456789%3Bencoding%3Dhex&X-Name=Agent%2C+A"

	dial.InnerElements = []twiml.Element{sip}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
