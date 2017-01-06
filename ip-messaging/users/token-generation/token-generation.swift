let deviceId = UIDevice.current.identifierForVendor!.uuidString
let urlString = "http://localhost:8000/token.php?device=\(deviceId)"

// Make HTTP request
if let requestURL = URL(string: urlString) {
  let session = URLSession(configuration: URLSessionConfiguration.default)
  let task = session.dataTask(with: requestURL, completionHandler: { (data, response, error) in
      if let data = data {
          do {
              let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:String]
              let token = json["token"]
              let identity = json["identity"]
          }
          catch let error as NSError {
            print ("Error with json, error = \(error)")
          }
          
      } else {
        print ("Error fetching json, error = \(error)")
      }
  })
  task.resume()
}