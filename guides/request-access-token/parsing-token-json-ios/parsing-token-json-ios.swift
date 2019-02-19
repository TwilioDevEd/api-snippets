struct TokenResponse: Decodable {
    var identity: String
    var token: String
}

func requestToken() {
    let tokenURL = "https://your-server-here/token"
    
    let decoder = JSONDecoder()
    if let url = URL(string: tokenURL) {
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let json = data {
                do {
                    let tokenResponse = try decoder.decode(TokenResponse.self, from: json)
                    print(tokenResponse.identity)
                    print(tokenResponse.token)
                } catch {
                    print(error)
                }
            } else {
                if let error = error {
                    print(error)
                }
            }
        }
        task.resume()
    }
}