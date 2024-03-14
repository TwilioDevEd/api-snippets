package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}
	application := &twiml.VoiceApplication{}
	application.CustomerId = "CustomerFriendlyName"

	applicationSid := &twiml.VoiceApplicationSid{}
	applicationSid.Sid = "AP1234567890abcdef1234567890abcd"

	application.InnerElements = []twiml.Element{applicationSid}
	dial.InnerElements = []twiml.Element{application}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
