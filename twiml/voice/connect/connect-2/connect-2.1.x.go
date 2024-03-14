package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	connect := &twiml.VoiceConnect{}

	room := &twiml.VoiceRoom{}
	room.Name = "DailyStandup"
	room.ParticipantIdentity = "alice"

	connect.InnerElements = []twiml.Element{room}

	twimlResult, err := twiml.Voice([]twiml.Element{connect})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
