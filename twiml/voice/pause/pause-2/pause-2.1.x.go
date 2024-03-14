package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	pause := &twiml.VoicePause{}
	pause.Length = "5"

	say := &twiml.VoiceSay{}
	say.Message = "Hi there."

	twimlResult, err := twiml.Voice([]twiml.Element{pause, say})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
