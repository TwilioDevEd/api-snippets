// Token server endpoint URL
let urlString = "http://localhost:8000/token.php"

// Get JSON from server
let config = NSURLSessionConfiguration.defaultSessionConfiguration()
let session = NSURLSession(configuration: config, delegate: nil, delegateQueue: nil)
let url = NSURL(string: urlString)
let request  = NSMutableURLRequest(URL: url!)
request.HTTPMethod = "GET"

// Make HTTP request
session.dataTaskWithRequest(request, completionHandler: { data, response, error in
  if (data != nil) {
    // Parse result JSON
    let json = JSON(data: data!)
    let token = json["token"].stringValue
    let identity = json["identity"].stringValue
  }
}).resume()