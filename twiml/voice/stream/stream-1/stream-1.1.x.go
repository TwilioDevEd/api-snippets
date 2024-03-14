package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	start := &twiml.VoiceStart{}

	stream := &twiml.VoiceStream{}
	stream.Name = "Example Audio Stream"
	stream.Url = "wss://mystream.ngrok.io/audiostream"

	start.InnerElements = []twiml.Element{stream}

	twimlResult, err := twiml.Voice([]twiml.Element{start})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
