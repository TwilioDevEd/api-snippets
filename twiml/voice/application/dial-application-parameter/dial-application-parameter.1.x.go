package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}
	application := &twiml.VoiceApplication{}

	applicationSid := &twiml.VoiceApplicationSid{}
	applicationSid.Sid = "AP1234567890abcdef1234567890abcd"

	parameter1 := &twiml.VoiceParameter{}
	parameter1.Name = "AccountNumber"
	parameter1.Value = "12345"

	parameter2 := &twiml.VoiceParameter{
		Name:  "TicketNumber",
		Value: "9876",
	}

	application.InnerElements = []twiml.Element{applicationSid, parameter1, parameter2}
	dial.InnerElements = []twiml.Element{application}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
