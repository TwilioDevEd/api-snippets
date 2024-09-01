package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}

	number := &twiml.VoiceNumber{}
	number.PhoneNumber = "+12143211432"

	sip1 := &twiml.VoiceSip{}
	sip1.SipUrl = "sip:alice-soft-phone@example.com"

	sip2 := &twiml.VoiceSip{}
	sip2.SipUrl = "sip:alice-desk-phone@example.com"

	sip3 := &twiml.VoiceSip{}
	sip3.SipUrl = "sip:alice-mobile-client@example.com"

	dial.InnerElements = []twiml.Element{number, sip1, sip2, sip3}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
