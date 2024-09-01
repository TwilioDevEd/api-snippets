package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}
	dial.Record = "record-from-answer"
	dial.Timeout = "10"
	dial.HangupOnStar = "true"
	dial.CallerId = "bob"
	dial.Method = "POST"
	dial.Action = "/handle_post_dial"

	sip := &twiml.VoiceSip{}
	sip.SipUrl = "sip:kate@example.com?x-customheader=foo"
	sip.Url = "/handle_screening_on_answer"
	sip.Method = "POST"

	dial.InnerElements = []twiml.Element{sip}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
