package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}

	sip := &twiml.VoiceSip{}
	sip.SipUrl = "sip:jack@example.com;transport=tls"

	dial.InnerElements = []twiml.Element{sip}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
