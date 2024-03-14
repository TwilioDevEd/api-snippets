package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	dial := &twiml.VoiceDial{}

	queue := &twiml.VoiceQueue{}
	queue.Name = "support"
	queue.Url = "about_to_connect.xml"

	dial.InnerElements = []twiml.Element{queue}

	twimlResult, err := twiml.Voice([]twiml.Element{dial})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
