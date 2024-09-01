package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	enqueue := &twiml.VoiceEnqueue{}
	enqueue.Name = "support"
	enqueue.WaitUrl = "wait-music.xml"

	twimlResult, err := twiml.Voice([]twiml.Element{enqueue})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
