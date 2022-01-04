// The data for the image you would like to send
let data = Data()

// Prepare the message and send it
self.conversation.prepareMessage
    .addMedia(data: data, contentType: "image/jpeg", filename: "image.jpg", listener: .init(onStarted: {
        // Called when upload of media begins.
        print("Media upload started")
    }, onProgress: { bytes in
        // Called as upload progresses, with the current byte count.
        print("Media upload progress: \(bytes)")
    }, onCompleted: { sid in
        // Called when upload is completed, with the new mediaSid if successful.
        // Full failure details will be provided through sendMessage's completion.
        print("Media upload completed")
    }, onFailed: { error in
        // Called when upload is completed, with the new mediaSid if successful.
        // Full failure details will be provided through sendMessage's completion.
        print("Media upload failed with error: \(error)")
    }))
    .buildAndSend { result, message in
        if !result.isSuccessful {
            print("Creation failed: \(String(describing: result.error))")
        } else {
            print("Creation successful")
        }
    }
