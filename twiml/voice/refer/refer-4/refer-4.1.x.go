package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	refer := &twiml.VoiceRefer{}
	refer.Action = "/handleRefer"
	refer.Method = "POST"

	sip := &twiml.VoiceSip{}
	sip.SipUrl = "sip:alice@example.com"

	refer.InnerElements = []twiml.Element{sip}

	twimlResult, err := twiml.Voice([]twiml.Element{refer})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
