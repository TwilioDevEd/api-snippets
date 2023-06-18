package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}
	dial.Record = "record-from-ringing-dual"
	dial.RecordingStatusCallback = "www.myexample.com"

	number := &twiml.VoiceNumber{}
	number.PhoneNumber = "+15558675310"

	dial.InnerElements = []twiml.Element{number}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
