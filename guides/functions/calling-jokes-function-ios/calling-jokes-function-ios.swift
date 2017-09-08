let functionURL = "https://yourdomain.twil.io/jokes"
if let url = URL(string: functionURL) {
    let task = URLSession.shared.dataTask(with: url) {
        data, response, error in
        if error != nil {
            print(error!)
        } else {
            do {
                let responseObject = try JSONSerialization.jsonObject(with: data!) as! [[String:Any]]
                print(responseObject)
            } catch let error as NSError {
                print(error)
            }
        }
    }
    task.resume()
}