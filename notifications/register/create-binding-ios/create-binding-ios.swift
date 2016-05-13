func registerDevice(identity: String, deviceToken: String) {
  //Init request
  Alamofire.request(.POST, serverURL, parameters: ["identity": identity,
                                                  "endpoint" : identity+deviceToken,
                                               "BindingType" : "apn",
                                                   "Address" : deviceToken])
           .responseJSON { response in
             let result = NSString(data: response.data!, encoding: NSUTF8StringEncoding)
             if result != "Success" {
               print("Error: registration not successful")
             }
        }
}