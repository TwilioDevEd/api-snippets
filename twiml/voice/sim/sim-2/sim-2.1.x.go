package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}
	dial.Record = "record-from-ringing"

	sim := &twiml.VoiceSim{}
	sim.SimSid = "DE8caa2afb9d5279926619c458dc7098a8"

	dial.InnerElements = []twiml.Element{sim}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
