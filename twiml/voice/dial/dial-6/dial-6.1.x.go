package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}
	dial.Record = "record-from-ringing-dual"
	dial.RecordingStatusCallback = "www.myexample.com"

	conference := &twiml.VoiceConference{}
	conference.Name = "myteamroom"

	dial.InnerElements = []twiml.Element{conference}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
