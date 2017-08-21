// The data for the image you would like to send
let data = Data()

// Prepare the upload stream and parameters
let messageOptions = TCHMessageOptions()
let inputStream = InputStream(data: data)
messageOptions.withMediaStream(inputStream,
                               contentType: "image/jpeg",
                               defaultFilename: "image.jpg",
                               onStarted: {
                                // Called when upload of media begins.
},
                               onProgress: { (bytes) in
                                // Called as upload progresses, with the current byte count.
}) { (mediaSid) in
    // Called when upload is completed, with the new mediaSid if successful.
    // Full failure details will be provided through sendMessage's completion.
}

// Trigger the sending of the message.
self.channel.messages?.sendMessage(with: messageOptions,
                                   completion: { (result, message) in
                                    if !result.isSuccessful() {
                                        print("Creation failed: \(String(describing: result.error))")
                                    } else {
                                        print("Creation successful")
                                    }
}) 
