  func registerDevice(identity: String, deviceToken: String) {

    // Create a POST request to the /register endpoint with device variables to register for Twilio Notifications
    let session = NSURLSession.sharedSession()

    let url = NSURL(string: serverURL)
    let request = NSMutableURLRequest(URL: url!, cachePolicy: .UseProtocolCachePolicy, timeoutInterval: 30.0)
    request.HTTPMethod = "POST"

    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    let params = ["identity": identity,
                  "BindingType" : "apn",
                  "Address" : deviceToken]

    //Check if we have an Endpoint identifier already for this app
    if let endpoint = try? KeychainAccess.readEndpoint(identity: identity){
        params["endpoint"] = endpoint
    } else {
      print("Error retrieving endpoint from keychain: \(error)")
    }


    let jsonData = try! NSJSONSerialization.dataWithJSONObject(params, options: [])
    request.HTTPBody = jsonData

    let task = session.dataTaskWithRequest(request) { (responseData:NSData?, response:NSURLResponse?, error:NSError?) in
      if let responseData = responseData {
        let responseString = NSString(data: responseData, encoding: NSUTF8StringEncoding)
        print("Response Body: \(responseString)")
        do {
          let responseObject = try NSJSONSerialization.JSONObjectWithData(responseData, options: [])
          print("JSON: \(responseObject)")
          if let responseDictionary = responseObject as? [String: Any] {
            try KeychainAccess.saveEndpoint(identity: identity, endpoint: responseDictionary["endpoint"] as! String)
          }
        } catch let error {
          print("Error: \(error)")
        }
      }
    }
    task.resume()
  }
