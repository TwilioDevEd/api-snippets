package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	record := &twiml.VoiceRecord{}
	record.Transcribe = "true"
	record.TranscribeCallback = "/handle_transcribe.php"

	twimlResult, err := twiml.Voice([]twiml.Element{record})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
