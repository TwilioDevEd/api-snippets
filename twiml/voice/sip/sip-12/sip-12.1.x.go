package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}
	dial.Sequential = "true"

	sip1 := &twiml.VoiceSip{}
	sip1.SipUrl = "sip:alice@example.com"

	sip2 := &twiml.VoiceSip{}
	sip2.SipUrl = "sip:bob@example.com"

	sip3 := &twiml.VoiceSip{}
	sip3.SipUrl = "sip:charlie@example.com"

	dial.InnerElements = []twiml.Element{sip1, sip2, sip3}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
