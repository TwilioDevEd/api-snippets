let functionURL = "https://yourdomain.twil.io/joke"
if let url = URL(string: functionURL) {
    let task = URLSession.shared.dataTask(with: url) {
        data, response, error in
        if error != nil {
            print(error!)
        } else {
            if let responseString = String(data: data!, encoding: .utf8) {
                print(responseString)
            }
        }
    }
    task.resume()
}
