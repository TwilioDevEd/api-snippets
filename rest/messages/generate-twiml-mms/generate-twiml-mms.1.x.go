package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/twilio/twilio-go/twiml"
)

func main() {
	router := gin.Default()

	router.POST("/sms", func(context *gin.Context) {
		message := &twiml.MessagingMessage{
			InnerElements: []twiml.Element{
				twiml.MessagingBody{
					Message: "The Robots are coming! Head for the hills!",
				},
				twiml.MessagingMedia{
					Url: "https://farm8.staticflickr.com/7090/6941316406_80b4d6d50e_z_d.jpg",
				},
			},
		}

		twimlResult, _ := twiml.Messages([]twiml.Element{message})

		context.Header("Content-Type", "text/xml; charset=\"utf-8\"")
		context.String(http.StatusOK, twimlResult)
	})

	router.Run(":3000")
}
