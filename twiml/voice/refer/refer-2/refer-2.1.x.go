package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	refer := &twiml.VoiceRefer{}

	sip := &twiml.VoiceSip{}
	sip.SipUrl = "sip:alice@example.com?X-AcctNumber=123456&X-ReasonForCalling=billing-question"

	refer.InnerElements = []twiml.Element{sip}

	twimlResult, err := twiml.Voice([]twiml.Element{refer})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
