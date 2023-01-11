package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/twilio/twilio-go/twiml"
)

func main() {
	router := gin.Default()

	router.POST("/sms", func(context *gin.Context) {
		messageBody := twiml.MessagingBody{
			Message: "The Robots are coming! Head for the hills!",
		}
		messageMedia := twiml.MessagingMedia{
			Url: "https://farm8.staticflickr.com/7090/6941316406_80b4d6d50e_z_d.jpg",
		}
		message := &twiml.MessagingMessage{
			InnerElements: []twiml.Element{messageBody, messageMedia},
		}

		twimlResult, err := twiml.Messages([]twiml.Element{message})
		if err != nil {
			context.String(http.StatusInternalServerError, err.Error())
		} else {
			context.Header("Content-Type", "text/xml")
			context.String(http.StatusOK, twimlResult)
		}
	})

	router.Run(":3000")
}
