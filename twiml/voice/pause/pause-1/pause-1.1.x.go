package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	say1 := &twiml.VoiceSay{}
	say1.Message = "I will pause 10 seconds starting now!"

	pause := &twiml.VoicePause{}
	pause.Length = "10"

	say2 := &twiml.VoiceSay{}
	say2.Message = "I just paused 10 seconds"

	twimlResult, err := twiml.Voice([]twiml.Element{say1, pause, say2})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
