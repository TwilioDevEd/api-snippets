package main

import (
	"fmt"

	"github.com/twilio/twilio-go/twiml"
)

func main() {
	say1 := &twiml.VoiceSay{}
	say1.Message = "Please leave a message at the beep.\nPress the star key when finished."

	record := &twiml.VoiceRecord{}
	record.Action = "http://foo.edu/handleRecording.php"
	record.Method = "GET"
	record.MaxLength = "20"
	record.FinishOnKey = "*"

	say2 := &twiml.VoiceSay{}
	say2.Message = "I did not receive a recording"

	twimlResult, err := twiml.Voice([]twiml.Element{say1, record, say2})
	if err == nil {
		fmt.Println(twimlResult)
	} else {
		fmt.Println(err)
	}
}
