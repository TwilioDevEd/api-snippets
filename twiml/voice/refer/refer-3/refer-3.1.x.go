package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	refer := &twiml.VoiceRefer{}

	sip := &twiml.VoiceSip{}
	sip.SipUrl = "sip:alice@example.com?User-to-User=123456789%3Bencoding%3Dhex"

	refer.InnerElements = []twiml.Element{sip}

	twimlResult, err := twiml.Voice([]twiml.Element{refer})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}