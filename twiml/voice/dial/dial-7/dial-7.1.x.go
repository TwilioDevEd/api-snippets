package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}
	dial.Record = "record-from-answer"
	dial.RecordingTrack = "inbound"
	dial.RecordingStatusCallback = "https://www.myexample.com/recording-handler"

	number := &twiml.VoiceNumber{}
	number.PhoneNumber = "+15551239876"

	dial.InnerElements = []twiml.Element{number}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
