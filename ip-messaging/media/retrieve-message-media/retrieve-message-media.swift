// Set up output stream for media content
let tempFilename = (NSTemporaryDirectory() as NSString).appendingPathComponent(message.mediaFilename ?? "file.dat")
let outputStream = OutputStream(toFileAtPath: tempFilename, append: false)

// Request the start of the download
if let outputStream = outputStream {
    message.getMediaWith(outputStream,
                         onStarted: {
                            // Called when download of media begins.
    },
                         onProgress: { (bytes) in
                            // Called as download progresses, with the current byte count.
    },
                         onCompleted: { (mediaSid) in
                            // Called when download is completed, with the new mediaSid if successful.
                            // Full failure details will be provided through the completion block below.
    }) { (result) in
        if !result.isSuccessful() {
            print("Download failed: \(String(describing: result.error))")
        } else {
            print("Download successful")
        }
    }
}
